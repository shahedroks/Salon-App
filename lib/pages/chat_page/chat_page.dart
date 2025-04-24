import 'package:flutter/material.dart';
import 'package:selon/model_controler/users_model.dart';

import '../../utils/assets_path.dart';

class ChatPage extends StatefulWidget {
  UsersModel userdata;
  ChatPage({super.key, required this.userdata});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heigth = size.height;
    final width = size.width;
    UsersModel? data = widget.userdata;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: width * 0.02),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    data.image != null && data.image!.isNotEmpty
                        ? data.image!
                        : ImagesPath.networkImage,
                  ),
                ),
                SizedBox(width: width * 0.08),
                Column(
                  children: [
                    Text(
                      '${data.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.greenAccent, size: 13),
                        SizedBox(width: width * 0.02),
                        Text('Active Status', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.more_vert_sharp, size: 32),
                ),
              ],
            ),
            SizedBox(height: heigth * 0.02),
            Divider(),
            SizedBox(height: heigth * 0.03),
            Row(
              children: [
                SizedBox(width: width * 0.02),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    data.image != null && data.image!.isNotEmpty
                        ? data.image!
                        : ImagesPath.networkImage,
                  ),
                ),
                SizedBox(width: width * 0.03),
                Container(
                  height: heigth * 0.05,
                  width: width * 0.8,

                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: heigth * 0.02),
            Row(
              children: [
                SizedBox(width: width * 0.02),
                Container(
                  height: heigth * 0.05,
                  width: width * 0.8,

                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.03),

                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    data.image != null && data.image!.isNotEmpty
                        ? data.image!
                        : ImagesPath.networkImage,
                  ),
                ),
                SizedBox(width: width * 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
