import 'package:flutter/material.dart';

class NiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Infographic Design')),
        body: Infographic(),
      ),
    );
  }
}

class Infographic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfographicSection(
            color: Colors.red,
            icon: Icons.present_to_all,
            text: 'This is a sample text. Enter Your text Here.',
          ),
          NodeConnector(),
          InfographicSection(
            color: Colors.orange,
            icon: Icons.radio_button_checked,
            text: 'This is a sample text. Enter Your text Here.',
          ),
          NodeConnector(),
          InfographicSection(
            color: Colors.green,
            icon: Icons.show_chart,
            text: 'This is a sample text. Enter Your text Here.',
          ),
          NodeConnector(),
          InfographicSection(
            color: Colors.blue,
            icon: Icons.people,
            text: 'This is a sample text. Enter Your text Here.',
          ),
          NodeConnector(),
          InfographicSection(
            color: Colors.purple,
            icon: Icons.group,
            text: 'This is a sample text. Enter Your text Here.',
          ),
        ],
      ),
    );
  }
}

class InfographicSection extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  InfographicSection({
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 36),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

class NodeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 4.0, height: 16.0, color: Colors.grey),
        CircleAvatar(radius: 6, backgroundColor: Colors.grey),
        Container(width: 4.0, height: 16.0, color: Colors.grey),
      ],
    );
  }
}
