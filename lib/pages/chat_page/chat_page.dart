import 'package:flutter/material.dart';
import 'package:selon/model_controler/users_model.dart';
import 'package:selon/network_group/message_controle.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model_controler/message_model.dart';
import '../../utils/assets_path.dart';

class ChatPage extends StatefulWidget {
  UsersModel userdata;
  ChatPage({super.key, required this.userdata});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

late TextEditingController sendMessageControler;
MessageControler _messageControler = MessageControler();

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heigth = size.height;
    final width = size.width;
    UsersModel? data = widget.userdata;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                          Icon(
                            Icons.circle,
                            color: Colors.greenAccent,
                            size: 13,
                          ),
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
              StreamBuilder(
                stream: _messageControler.getMessage(
                  "$userID",
                  "${data.email}",
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  var messages = snapshot.data;
                  return SizedBox(
                    height: heigth,
                    child: ListView.builder(
                      itemCount: messages?.length,
                      itemBuilder: (context, index) {
                        MessageModel _messages = messages![index];
                        bool isMe = userID == _messages.senderId;
                        return Row(
                          children: [
                            SizedBox(width: width * 0.02),
                            isMe == false
                                ? CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                    data.image != null && data.image!.isNotEmpty
                                        ? data.image!
                                        : ImagesPath.networkImage,
                                  ),
                                )
                                : Text(""),
                            SizedBox(
                              width: isMe ? width * 0.00 : width * 0.035,
                            ),
                            Container(
                              width: width * 0.8,
                              margin: EdgeInsets.symmetric(
                                vertical: width * 0.03,
                              ),
                              padding: EdgeInsets.all(width * 0.003),
                              decoration: BoxDecoration(
                                color: isMe ? Colors.blue : Colors.grey,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(isMe ? 20 : 0),
                                  bottomRight: Radius.circular(isMe ? 0 : 20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${_messages.text}",
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            isMe == true
                                ? CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                    data.image != null && data.image!.isNotEmpty
                                        ? data.image!
                                        : ImagesPath.networkImage,
                                  ),
                                )
                                : Text(""),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: sendMessageControler,
                decoration: InputDecoration(hintText: 'Type a message...'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                sendMessage("${data.email}");
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendMessageControler = TextEditingController();
    getEmail();
  }

  String userID = "";

  Future<void> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? getEmail = preferences.getString("email");
    if (getEmail != null) {
      setState(() {
        userID = getEmail;
      });
    }
  }

  void sendMessage(String receiverID) async {
    if (sendMessageControler.text.isNotEmpty) {
      _messageControler.sendMessage(receiverID, sendMessageControler.text);
      sendMessageControler.clear();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sendMessageControler.dispose();
  }
}
