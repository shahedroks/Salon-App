import 'dart:async';

import 'package:flutter/material.dart';

class CustomUpperPageview extends StatefulWidget {
  const CustomUpperPageview({super.key});

  @override
  State<CustomUpperPageview> createState() => _CustomUpperPageviewState();
}

final List<Color> _colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.orange,
];

class _CustomUpperPageviewState extends State<CustomUpperPageview> {
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageChange();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: Stack(
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
    ;
  }

  int _currentPage = 0;
  Timer? _timer;
  pageChange() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
