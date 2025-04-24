import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:selon/model_controler/users_model.dart';
import 'package:selon/pages/chat_page/chat_page.dart';
import 'package:selon/utils/assets_path.dart';

import '../../network_group/data_controler.dart';

class UsersProfilePage extends StatefulWidget {
  String email;
  UsersProfilePage({super.key, required this.email});

  @override
  State<UsersProfilePage> createState() => _UsersProfilePageState();
}

UsersModel? profileUser;

class _UsersProfilePageState extends State<UsersProfilePage> {
  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.pop(context, true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                        child: Image.network(
                          "${profileUser?.image != null && profileUser!.image!.isNotEmpty ? profileUser?.image : ImagesPath.networkImage}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.24,
                      left: 0,
                      right: 0,

                      child: Visibility(
                        visible: DataController.isCerculerDataControler = true,
                        replacement: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                        child: Container(
                          height: height * 0.72,
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
                            child: Visibility(
                              visible: dataChecker = true,
                              replacement: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                              child: Column(
                                children: [
                                  Row(children: [Icon(Icons.settings)]),
                                  SizedBox(height: height * 0.05),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.05,
                                    ),
                                    child: Text(
                                      "${usersModel?.bio}",
                                      style: const TextStyle(fontSize: 12),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      MaterialIcons.sms,
                                      color: Colors.blue,
                                    ),
                                    title: const Text(
                                      "Massage",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    onTap: () {
                                      goToChatPage();
                                    },
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: const Icon(
                                      Fontisto.person,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      "${usersModel?.name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),

                                    onTap: () {},
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: const Icon(
                                      MaterialIcons.email,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      "${usersModel?.email}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    trailing: const Icon(
                                      Icons.verified_user_outlined,
                                      color: Colors.green,
                                    ),
                                    onTap: () {},
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: const Icon(
                                      MaterialIcons.call,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      "${usersModel?.number}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    trailing: const Icon(
                                      Icons.verified_user_outlined,
                                      color: Colors.green,
                                    ),
                                    onTap: () {},
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: const Icon(
                                      MaterialIcons.location_city,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      "${usersModel?.address}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: Icon(
                                      usersModel?.gender == "male"
                                          ? MaterialCommunityIcons.gender_male
                                          : MaterialCommunityIcons
                                              .gender_female,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      "${usersModel?.gender}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                  Divider(),
                                  ListTile(
                                    leading: const Icon(
                                      Fontisto.person,
                                      color: Colors.blue,
                                    ),
                                    title: Text(
                                      "${usersModel?.username}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    onTap: () {},
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
                                        NetworkImage(
                                              "${profileUser?.image != null && profileUser!.image!.isNotEmpty ? profileUser?.image : ImagesPath.networkImage}",
                                            )
                                            as ImageProvider,
                                    fit: BoxFit.cover,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool profileChecker = false;
  UsersModel? usersModel;

  void goToChatPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage(userdata: usersModel!)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lodeUserData();
  }

  void lodeUserData() async {
    dataChecker = true;
    UsersModel? result = await getUserData();
    setState(() {
      usersModel = result;
      dataChecker = false;
    });
  }

  bool dataChecker = false;
  Future<UsersModel?> getUserData() async {
    dataChecker = true;
    List<UsersModel> users = await DataController.getAllUsers() ?? [];
    try {
      return users.firstWhere((item) => item.email == widget.email);
      dataChecker = false;
    } catch (e) {
      return null;
    }
  }
}
