import 'package:flutter/material.dart';

class CustomNotificationFild extends StatelessWidget {
  String? text;
  bool? isCheck;
  CustomNotificationFild({super.key, this.text, this.isCheck = false});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isCheck == false
            ? Text(
              "$text",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
            : Text(""),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage:
                  isCheck == true
                      ? AssetImage("assets/image/OnBoarding1.png")
                      : null,
              child:
                  isCheck == true ? null : Icon(Icons.account_balance_rounded),
            ),
            title: Row(children: [Text("New Notification")]),
            subtitle: const Text("You have a new notification"),
            trailing: Column(
              mainAxisSize: MainAxisSize.max, // এটায় Row টা বড় হয়ে যাবে না
              children: [
                Text("2 days ago"),
                SizedBox(height: height * 0.01), // 1% height
                isCheck == false
                    ? CircleAvatar(radius: 5, backgroundColor: Colors.red)
                    : CircleAvatar(
                      radius: 10,
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), // অথবা Text('!') বা অন্য কিছু
              ],
            ),
            onTap: () {
              // Handle tap
            },
          ),
        ),
      ],
    );
  }
}
