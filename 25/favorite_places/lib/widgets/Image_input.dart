import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  ImageInput({super.key, required this.onPickImage});

  final Function(File image) onPickImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  void _takePictrte() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _storedImage = File(pickedImage.path);
    });
    widget.onPickImage(_storedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ElevatedButton.icon(
      onPressed: _takePictrte,
      icon: const Icon(Icons.camera),
      label: const Text('Add Photo'),
    );

    if (_storedImage != null) {
      content = Image.file(
        _storedImage!,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      child: content,
    );
  }
}
