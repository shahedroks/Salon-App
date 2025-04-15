import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selon/model_controler/users_model.dart';
import 'package:selon/pages/home_page/custom_wedget/image_picker.dart';
import 'package:selon/utils/assets_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network_group/data_controler.dart';
import '../sign_related_page/signin_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

UsersModel? profileUser;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Visibility(
        visible: DataController.isCerculerDataControler == false,
        replacement: const Center(
          child: CircularProgressIndicator(color: Colors.green),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        profileUser?.image != null &&
                                profileUser!.image!.isNotEmpty
                            ? NetworkImage(profileUser!.image!)
                            : NetworkImage("${ImagesPath.networkImage}")
                                as ImageProvider,
                    // অথবা আপনি চাইলে: NetworkImage(user!.photoURL ?? '')
                  ),
                  Positioned(right: 0, bottom: 0, child: ProfilePhotoPicker()),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "${profileUser?.name}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              ListTile(
                leading: const Icon(Icons.email),
                title: Text("${profileUser?.email}"),
                onTap: () {
                  // Settings action
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  // Settings action
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () {
                  Logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  File? _pickedImage;
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerSheet() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Take from Camera"),
                  onTap: () => _pickImage(ImageSource.camera),
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text("Choose from Gallery"),
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
          ),
    );
  }

  void updateData(String? email, String? keyName, String? value) async {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    instance.collection("users").doc("$email").set({
      "$keyName": "$value",
    }, SetOptions(merge: true));
    setState(() {});
  }

  void loadUserData() async {
    DataController.isCerculerDataControler = true;
    var modelUsers = await DataController.getSignUsersData();
    DataController.isCerculerDataControler = false;
    setState(() {
      profileUser = modelUsers;
    });
  }

  void Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                prefs.clear();
                if (prefs.getString("email") == null) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                    (predicate) => false,
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
