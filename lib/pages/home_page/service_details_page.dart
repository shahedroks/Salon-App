import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final String serviceName;
  const ServiceDetailsPage({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(serviceName)),
      body: Center(child: Text('Details for $serviceName')),
    );
  }
}
