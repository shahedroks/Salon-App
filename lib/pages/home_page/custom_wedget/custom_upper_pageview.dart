import 'dart:async';

import 'package:flutter/material.dart';
import 'package:selon/network_group/data_controler.dart';

class CustomUpperPageview extends StatefulWidget {
  bool isPageChecker;
  CustomUpperPageview({super.key, this.isPageChecker = false});

  @override
  State<CustomUpperPageview> createState() => _CustomUpperPageviewState();
}

class _CustomUpperPageviewState extends State<CustomUpperPageview> {
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageChange(widget.isPageChecker);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    widget.isPageChecker == true ? 20 : 0,
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        color: DataController.color[index],
                        child: Center(
                          child: Text(
                            'Page ${index + 1}',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                widget.isPageChecker == true
                    ? Positioned(
                      right: 0,
                      top: 50,
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    )
                    : Text(""),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          widget.isPageChecker == false
              ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(DataController.color.length, (index) {
                    return InkWell(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        width: width * 0.08,
                        height: height * 0.06,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: DataController.color[index],
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    );
                  }),
                ),
              )
              : Text(""),
        ],
      ),
    );
    ;
  }

  int _currentPage = 0;
  Timer? _timer;

  pageChange(bool isChecker) {
    if (isChecker == true) {
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
