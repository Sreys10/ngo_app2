import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';

class WasteDetectionPage extends StatefulWidget {
  const WasteDetectionPage({super.key});

  @override
  _WasteDetectionPageState createState() => _WasteDetectionPageState();
}

class _WasteDetectionPageState extends State<WasteDetectionPage> {
  File? _image; // To store the selected image
  List<dynamic>? _recognitions; // To store the model's output
  bool _isLoading = false; // To show a loading indicator

  @override
  void initState() {
    super.initState();
    _loadModel(); // Load the TFLite model when the page is initialized
  }

  @override
  void dispose() {
    Tflite.close(); // Close the TFLite model when the page is disposed
    super.dispose();
  }

  // Load the TFLite model
  Future<void> _loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/waste.TFLite", // Path to your TFLite model
        labels: "assets/labels.txt", // Path to your labels file (if any)
      );
      print("Model loaded: $res");
    } catch (e) {
      print("Failed to load model: $e");
    }
  }

  // Pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isLoading = true;
      });
      _runModelOnImage(_image!);
    }
  }

  // Capture an image using the camera
  Future<void> _captureImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isLoading = true;
      });
      _runModelOnImage(_image!);
    }
  }

  // Run the model on the selected image
  Future<void> _runModelOnImage(File image) async {
    if (image == null) return;

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5, // Number of results to return
      threshold: 0.5, // Confidence threshold
      imageMean: 127.5, // Image mean for normalization
      imageStd: 127.5, // Image standard deviation for normalization
    );

    setState(() {
      _recognitions = recognitions;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('कचरा शोध'), // Waste Detection in Marathi
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_recognitions != null)
              Expanded(
                child: ListView.builder(
                  itemCount: _recognitions!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_recognitions![index]['label']),
                        subtitle: Text(
                            'Confidence: ${(_recognitions![index]['confidence'] * 100).toStringAsFixed(2)}%'),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImageFromGallery,
                  icon: const Icon(Icons.photo_library),
                  label: const Text(
                      'गॅलरीतून निवडा'), // Pick from Gallery in Marathi
                ),
                ElevatedButton.icon(
                  onPressed: _captureImageFromCamera,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('कॅमेरा वापरा'), // Use Camera in Marathi
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
