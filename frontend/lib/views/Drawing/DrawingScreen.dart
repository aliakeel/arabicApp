import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;
import 'package:kaleela/views/Drawing/DrawingPainter.dart';
import 'dart:ui' as ui;

import 'package:tflite_v2/tflite_v2.dart';

class DrawingScreen extends StatefulWidget {
  // late GlobalKey _globalKey;
  // DrawingScreen(key) : super(key: key) {
  //   _globalKey = key;
  // }

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset?> _points = [];
  final GlobalKey _globalKey = GlobalKey();
  var _recognitions;
  var v = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/ml_model/optimized_arabic_character_cnn_model.tflite",
      labels: "assets/ml_model/labels.txt",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw a Letter'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _points.clear();
                v = "";
              });
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _points.add(details.localPosition);
            });
          },
          onPanEnd: (details) {
            _points.add(null); // Stop drawing when the user lifts their finger
          },
          child: RepaintBoundary(
            key: _globalKey,
            child: CustomPaint(
              painter: DrawingPainter(points: _points),
              size: Size.infinite,
            ),
          ),
          // CustomPaint(
          //   painter: DrawingPainter(points: _points),
          //   size: Size.infinite,
          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          _processDrawing();
        },
      ),
      bottomSheet: Text(v,
          style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              backgroundColor: Colors.black)),
    );
  }

  Uint8List preprocessImage(Uint8List imageBytes) {
    img.Image? image = img.decodeImage(imageBytes);
    img.Image resizedImage = img.copyResize(image!, width: 64, height: 64);

    // Convert to grayscale if required
    img.Image grayscaleImage = img.grayscale(resizedImage);

    // Convert to byte array
    Uint8List input = grayscaleImage.getBytes(format: img.Format.luminance);

    // Normalize the image
    Float32List float32Input = Float32List(input.length);
    for (int i = 0; i < input.length; i++) {
      float32Input[i] = input[i] / 255.0;
    }

    return float32Input.buffer.asUint8List();
  }

  // void _processDrawing() async {
  //   // Add logic to process the drawing and run model prediction
  //   RenderRepaintBoundary boundary =
  //       _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData!.buffer.asUint8List();
  // }

  void _processDrawing() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Preprocess the image
    Uint8List input = preprocessImage(pngBytes);

    // Run the model
    var recognitions = await Tflite.runModelOnBinary(
      binary: input,
      numResults: 28,
    );

    setState(() {
      _recognitions = recognitions;
      print("Recognized Letter: ");
      print(_recognitions);
      try {
        String recognizedLetter = _recognitions[0]['label'];
        print("Recognized Letter: $recognizedLetter");
        v = recognizedLetter;
      } catch (e) {
        print("No Letter has Recognized!");
      }
    });
  }
}
