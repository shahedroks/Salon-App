import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selon/model_controler/users_model.dart';
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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    height: height * 0.3,
                    width: width,
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      "${ImagesPath.covoreImage}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: height * 0.24,
                  left: 0,
                  right: 0,

                  child: Container(
                    height: height * 0.7,
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.settings),
                              Spacer(),
                              Icon(Icons.edit_calendar_outlined),
                            ],
                          ),
                          SizedBox(height: height * 0.05),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                            ),
                            child: Text(
                              "${profileUser?.bio}",
                              style: const TextStyle(fontSize: 10),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: const Text("Name"),
                            subtitle: Text("${profileUser?.name}"),

                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: const Text("Email"),
                            subtitle: Text("${profileUser?.email}"),
                            trailing: const Icon(
                              Icons.verified_user_outlined,
                              color: Colors.green,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.location_city_sharp),
                            title: const Text("Address"),
                            subtitle: Text("${profileUser?.address}"),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.man),
                            title: const Text("Gender"),
                            subtitle: Text("${profileUser?.name}"),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.call),
                            title: const Text("Number"),
                            subtitle: Text("${profileUser?.number}"),
                            trailing: const Icon(
                              Icons.verified_user_outlined,
                              color: Colors.green,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.drive_file_rename_outline,
                            ),
                            title: const Text("Username"),
                            subtitle: Text("${profileUser?.username}"),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.login),
                            title: const Text("Logout"),
                            onTap: () {
                              Logout();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.18,
                  right: width * 0.35,

                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 3),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                "${profileUser?.image ?? ImagesPath.networkImage}",
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.verified, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool profileChecker = false;

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

  void updateProfileImage(String? email) async {}
}
