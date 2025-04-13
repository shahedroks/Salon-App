import 'package:flutter/material.dart';
import 'package:selon/pages/home_page/custom_wedget/custom_upper_pageview.dart';

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: height * 0.6,
                child: CustomUpperPageview(),
              ),
              SizedBox(height: height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Woman Medium Blunt Cut",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        SizedBox(width: width * 0.03),
                        Text("2,5 hours service"),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        Text(
                          "\$50.00",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF156778),
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          "\$70.00",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Spacer(),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade50,
                            fixedSize: Size(width * 0.30, height * 0.01),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.local_offer, color: Colors.orange),
                              Text(
                                "-20% off",
                                style: TextStyle(
                                  // fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF156778),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      height: height * 0.05,
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      "Abaut this service",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Sed do eiusmod tempor incididunt ut labore et dolore "
                      "magna aliqua. Ut enim ad minim veniam, quis nostrud "
                      "exercitation ullamco laboris nisi ut aliquip ex ea "
                      "commodo consequat. Duis aute irure dolor in reprehenderit "
                      "in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
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
}
