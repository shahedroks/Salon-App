import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoPicker extends StatefulWidget {
  const ProfilePhotoPicker({super.key});

  @override
  State<ProfilePhotoPicker> createState() => _ProfilePhotoPickerState();
}

class _ProfilePhotoPickerState extends State<ProfilePhotoPicker> {
  XFile? _pickedImage;

  Future<void> _pickAndCropImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (_pickedImage != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
    }
  }

  void _showImagePickerSheet() {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            height: height * 0.25,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: Text("${_pickedImage?.name ?? "Select"} from Camera"),
                  onTap: () => _pickAndCropImage(ImageSource.camera),
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: Text("${_pickedImage?.name ?? "Select"} from Gallery"),
                  onTap: () => _pickAndCropImage(ImageSource.gallery),
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                  ),
                  child: Text("Save"),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return InkWell(
      onTap: _showImagePickerSheet,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent.withOpacity(0.2),
        backgroundImage:
            _pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
        child:
            _pickedImage == null
                ? const Icon(Icons.edit, color: Colors.blue)
                : null,
      ),
    );
  }
}
