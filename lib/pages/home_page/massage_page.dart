import 'package:flutter/material.dart';
import 'package:selon/pages/home_page/custom_wedget/custom_notification_fild.dart';

class MassagePage extends StatefulWidget {
  const MassagePage({super.key});

  @override
  State<MassagePage> createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.001),
            CustomNotificationFild(isCheck: true),
            CustomNotificationFild(isCheck: true),
            CustomNotificationFild(isCheck: true),
            CustomNotificationFild(isCheck: true),
            CustomNotificationFild(isCheck: true),
            CustomNotificationFild(isCheck: true),
          ],
        ),
      ),
    );
  }
}
