// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:crop_your_image/crop_your_image.dart' as crop;
import 'package:flutter/material.dart';

class ImageCropWidget extends StatefulWidget {
  final File image;
  const ImageCropWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ImageCropWidget> createState() => _ImageCropWidgetState();
}

class _ImageCropWidgetState extends State<ImageCropWidget> {
  crop.CropController cropController = crop.CropController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          cropController.crop();
        },
        child: Icon(
          Icons.send,
        ),
      ),
      appBar: AppBar(
        title: const Text('Image Crop'),
      ),
      body: crop.Crop(
        fixArea: true,
        withCircleUi: true,
        controller: cropController,
        interactive: true,
        image: widget.image.readAsBytesSync(),
        onCropped: (croppedImage) {
          print(croppedImage);
        },
        onStatusChanged: (status){
          
        },
      ),
    );
  }
}
