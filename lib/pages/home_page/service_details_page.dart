import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({super.key});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

final List<Color> _colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.orange,
];
PageController _pageController = PageController();

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return SizedBox(
      width: width,
      height: height * 0.08,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 4,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: _colors[index],
                  child: Center(
                    child: Text(
                      'Page ${index + 1}',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            right: 0,
            top: 70,
            child: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }

  Future<void> _onPageChanged(int index) async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
