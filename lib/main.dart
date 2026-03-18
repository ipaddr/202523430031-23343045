import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HeadgearClassifier(),
    );
  }
}

class HeadgearClassifier extends StatefulWidget {
  const HeadgearClassifier({super.key});

  @override
  State<HeadgearClassifier> createState() => _HeadgearClassifierState();
}

class _HeadgearClassifierState extends State<HeadgearClassifier> {
  File? _image;
  List? _results;
  bool _loading = false;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  // Memuat model dari folder assets
  Future loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
      );
      debugPrint("Model Loaded: $res");
    } catch (e) {
      debugPrint("Error loading model: $e");
    }
  }

  // Melakukan klasifikasi gambar yang dipilih
  Future classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,      // Mengambil 5 hasil teratas dari 20 kelas
      threshold: 0.2,     // Menampilkan hasil jika keyakinan > 20%
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = output;
      _loading = false;
    });
  }

  // Mengambil gambar dari Kamera atau Galeri
  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return;

    setState(() {
      _loading = true;
      _image = File(pickedFile.path);
    });
    classifyImage(_image!);
  }

  @override
  void dispose() {
    Tflite.close(); // Penting untuk mencegah memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Headgear AI Classifier"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _image == null
                      ? Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.image, size: 100, color: Colors.grey),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 300,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(_image!, fit: BoxFit.cover),
                          ),
                        ),
                  const SizedBox(height: 20),
                  if (_results != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: _results!.map((res) {
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text("${_results!.indexOf(res) + 1}"),
                              ),
                              title: Text(
                                "${res['label']}".toUpperCase(),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: LinearProgressIndicator(
                                value: res['confidence'],
                                backgroundColor: Colors.grey[300],
                              ),
                              trailing: Text(
                                "${(res['confidence'] * 100).toStringAsFixed(2)}%",
                                style: const TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  else
                    const Text("Pilih gambar untuk mulai klasifikasi"),
                  const SizedBox(height: 40),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
            onPressed: () => pickImage(ImageSource.camera),
            label: const Text("Kamera"),
            icon: const Icon(Icons.camera_alt),
          ),
          FloatingActionButton.extended(
            onPressed: () => pickImage(ImageSource.gallery),
            label: const Text("Galeri"),
            icon: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}