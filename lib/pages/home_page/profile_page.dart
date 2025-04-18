import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selon/model_controler/users_model.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_sign_controler_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network_group/data_controler.dart';
import '../sign_related_page/signin_page.dart';
import 'custom_wedget/custom-textformfiled_profile_update.dart';
import 'custom_wedget/custom_cover_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

TextEditingController bio = TextEditingController(
  text: profileUser?.bio ?? "You Bio",
);
TextEditingController name = TextEditingController(
  text: profileUser?.name ?? "You Name",
);
TextEditingController address = TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController number = TextEditingController();
TextEditingController username = TextEditingController();

UsersModel? profileUser;
String selectedGender = '';

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  cover_image_widget(coverImagePicked: _coverPickedImage),
                  profileChecker == false
                      ? Text("")
                      : Positioned(
                        top: 150,
                        child: GestureDetector(
                          onTap: () {
                            updateCoverImage();
                            isCover = true;
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red.shade100,
                            child: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ),

                  Positioned(
                    top: height * 0.24,
                    left: 0,
                    right: 0,

                    child:
                        profileChecker == false
                            ? Visibility(
                              visible:
                                  DataController.isCerculerDataControler = true,
                              replacement: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                              child: Container(
                                height: height * 0.72,
                                width: width,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
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
                                          InkWell(
                                            onTap: () {
                                              profileChecker = true;
                                              setState(() {});
                                              print(profileChecker);
                                            },
                                            child: Icon(
                                              Icons.edit_calendar_outlined,
                                            ),
                                          ),
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
                                        leading: const Icon(
                                          Icons.location_city_sharp,
                                        ),
                                        title: const Text("Address"),
                                        subtitle: Text(
                                          "${profileUser?.address}",
                                        ),
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
                                        subtitle: Text(
                                          "${profileUser?.number}",
                                        ),
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
                                        subtitle: Text(
                                          "${profileUser?.username}",
                                        ),
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
                            )
                            : Visibility(
                              visible:
                                  DataController.isCerculerDataControler = true,
                              replacement: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                              child: Container(
                                height: height * 0.70,
                                width: width,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
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
                                  padding: const EdgeInsets.all(20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(height: height * 0.1),
                                        CustomTextFormFieldProfileUpdate(
                                          name: "Bio",
                                          prefixIcon: Icons.add,
                                          controlerName: bio,
                                          biofield: true,
                                        ),
                                        SizedBox(height: height * 0.01),
                                        CustomTextFormFieldProfileUpdate(
                                          name: "Name",
                                          prefixIcon: Icons.person,
                                          controlerName: name,
                                        ),
                                        SizedBox(height: height * 0.01),
                                        CustomTextFormFieldProfileUpdate(
                                          name: "Email",
                                          prefixIcon: Icons.email,
                                          controlerName: email,
                                        ),
                                        SizedBox(height: height * 0.01),
                                        CustomTextFormFieldProfileUpdate(
                                          name: "Address",
                                          prefixIcon: Icons.location_city_sharp,
                                          controlerName: address,
                                        ),
                                        SizedBox(height: height * 0.01),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Select Gender:',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(height: height * 0.01),
                                            RadioListTile(
                                              title: Text("Male"),
                                              value: "Male",
                                              groupValue: selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedGender = value!;
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text("Female"),
                                              value: "Female",
                                              groupValue: selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedGender = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(height: height * 0.01),
                                            Text(
                                              'Selected: ${selectedGender}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: height * 0.01),
                                        CustomTextFormFieldProfileUpdate(
                                          name: "Number",
                                          prefixIcon: Icons.call,
                                          controlerName: number,
                                        ),
                                        SizedBox(height: height * 0.01),
                                        CustomTextFormFieldProfileUpdate(
                                          name: "username",
                                          prefixIcon:
                                              Icons.drive_file_rename_outline,
                                          controlerName: username,
                                        ),
                                        SizedBox(height: height * 0.01),
                                        CustomSignControlerButton(
                                          onTap: () {
                                            DataController.updateData(
                                              name: name.text,
                                              email: email.text,
                                              bio: bio.text,
                                              adderss: address.text,
                                              gender: selectedGender,
                                              number: number.text,
                                              username: username.text,
                                              isCover: isCover,
                                              coverFilePath: _coverPickedImage,
                                              profileFilePath:
                                                  _pickedProfileImage,
                                              coverIamgeUrl:
                                                  profileUser?.cover_image ??
                                                  "",
                                              profileImageUrl:
                                                  profileUser?.image ?? "",
                                            );
                                          },
                                          showAvater: false,
                                          text: "Done",
                                          contenerColor: Colors.greenAccent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                  ),
                  Positioned(
                    top: height * 0.18,
                    right: width * 0.40,

                    child: Visibility(
                      visible: DataController.isCerculerDataControler = true,
                      replacement: CircularProgressIndicator(
                        color: Colors.blue,
                      ),

                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 3,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      _pickedProfileImage != null
                                          ? FileImage(
                                            _pickedProfileImage as File,
                                          )
                                          : NetworkImage(
                                                profileUser?.image ?? "",
                                              )
                                              as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          profileChecker == false
                              ? Positioned(
                                bottom: 0,
                                right: 0,
                                child: Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                ),
                              )
                              : Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    upProfileImage();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red.shade100,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool profileChecker = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
    name;
  }

  void updateCoverImage() {
    _showImagePickerSheet();
  }

  void upProfileImage() {
    _showImagePickerSheet();
  }

  void profileUpdate() {
    clearControler();
  }

  static Future<CroppedFile?> cropCustomImage(File imageFile) async {
    return await ImageCropper().cropImage(
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
  }

  File? _pickedProfileImage;
  File? _coverPickedImage;
  bool isCover = false;
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      File originalImage = File(pickedFile.path);
      CroppedFile? cropped = await cropCustomImage(originalImage);
      if (cropped != null) {
        File croppedFile = File(cropped.path);
        setState(() {
          if (isCover) {
            _coverPickedImage = croppedFile;
          } else {
            _pickedProfileImage = croppedFile;
          }
          Navigator.pop(context);
        });
      } else {
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
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

  void loadUserData() async {
    DataController.isCerculerDataControler = true;
    var modelUsers = await DataController.getSignUsersData();

    setState(() {
      profileUser = modelUsers;

      bio.text = profileUser?.bio ?? "You Bio";
      name.text = profileUser?.name ?? "You Name";
      email.text = profileUser?.email ?? "";
      address.text = profileUser?.address ?? "You Address";
      gender.text = profileUser?.bio ?? "You Bio";
      number.text = profileUser?.number ?? "You Number";
      username.text = profileUser?.username ?? "You username";
      DataController.isCerculerDataControler = false;
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

  void clearControler() {
    bio.clear();
    name.clear();
    email.clear();
    address.clear();
    number.clear();
    username.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bio.dispose();
    name.dispose();
    email.dispose();
    address.dispose();
    number.dispose();
    username.dispose();
  }
}
