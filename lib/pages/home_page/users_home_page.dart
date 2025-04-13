import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:selon/pages/home_page/custom_wedget/custom_upper_pageview.dart';
import 'package:selon/pages/home_page/profile_page.dart';
import 'package:selon/pages/home_page/service_details_page.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_upper_text_controler_sign.dart';

import 'massage_page.dart';
import 'notification_page.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({super.key});

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  int _currentIndex = 0;
  List<Map<String, String>> servicesWithLogos = [
    {
      'name': 'Beauty & Spa',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/3575/3575025.png', // Beauty & Spa logo
    },
    {
      'name': 'Face Care',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/2859/2859745.png', // Face Care logo
    },
    {
      'name': 'Wellness Beauty',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/3041/3041282.png', // Wellness Beauty logo
    },
    {
      'name': 'Spa & Wellness',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/2771/2771562.png', // Spa & Wellness logo
    },
    {
      'name': 'Minimalist Spa',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/3575/3575171.png', // Minimalist Spa logo
    },
    {
      'name': 'Haircut',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/3065/3065143.png', // Haircut logo
    },
    {
      'name': 'Nails',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/2854/2854609.png', // Nails logo
    },
    {
      'name': 'Facial',
      'logo':
          'https://cdn-icons-png.flaticon.com/512/3585/3585439.png', // Facial logo
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                Row(
                  children: [
                    CustomUpperTextControlerSign(
                      firstText: "Hello, Samantha",
                      secondText:
                          "Find the service you want, and treat yourself",
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: search,
                      style: IconButton.styleFrom(
                        backgroundColor: Color(0xff156778),
                      ),
                      icon: Icon(Icons.search, color: Colors.white, size: 35),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  height: height * 0.17,
                  width: width,
                  child: CustomUpperPageview(isPageChecker: true),
                ),
                SizedBox(height: height * 0.02),
                Text("What do you want to do?"),
                SizedBox(height: height * 0.02),
                Wrap(
                  spacing: 16.0, // Space between items
                  runSpacing: 20.0, // Space between rows
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // To prevent scrolling conflict with parent
                      itemCount: servicesWithLogos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 4 items per row
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.8, // Adjust for icon + text layout
                      ),
                      itemBuilder: (context, index) {
                        final service = servicesWithLogos[index];
                        return GestureDetector(
                          onTap: () => goToServiceDetails(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                child: Image.network(
                                  service['logo']!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                service['name']!.split(
                                  ' ',
                                )[0], // only first word
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Text("Salon And Flower Shop"),
                SizedBox(height: height * 0.02),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        servicesWithLogos.map((service) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: GestureDetector(
                              onTap: () => goToSalonDetails(),
                              child: CircleAvatar(
                                radius: 30,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.green,
                                      width: 2,
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(service['logo']!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: height * 0.02),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        servicesWithLogos.map((service) {
                          return Container(
                            width: width * 0.42,
                            child: GestureDetector(
                              onTap: () => gotoToFlowerDetails(),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Card(
                                        child: Container(
                                          width: width * 0.4,
                                          height: height * 0.2,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                service['logo']!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text(
                                            "Hair . Nails . Facial",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Text(
                                            service['name']!,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "360 Stillwater Rd. Palm City.",
                                            style: TextStyle(
                                              fontSize: 15,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              StarRating(
                                                rating: 3.5,
                                                size: 15,
                                                color:
                                                    Colors
                                                        .orange, // Color for filled and half-filled icons
                                                borderColor:
                                                    Colors
                                                        .grey, // Color for empty icons
                                              ),
                                              Text("(4.5)"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red.withOpacity(
                                        0.2,
                                      ),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => goToButttonNevigationPage(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.markunread_outlined),
            label: 'Massage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  void search() {}
  void goToServiceDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
    );
  }

  void goToSalonDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
    );
  }

  void gotoToFlowerDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServiceDetailsPage()),
    );
  }

  void goToNotificationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationPage()),
    );
  }

  void goToMassagePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MassagePage()),
    );
  }

  void gotoProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  void goToButttonNevigationPage(index) {
    {
      setState(() {
        _currentIndex = index;
      });
      if (index == 2) {
        goToNotificationPage();
      } else if (index == 1) {
        goToMassagePage();
      } else if (index == 4) {
        gotoProfilePage();
      }
    }
  }

  // Future<List<Map<String, dynamic>>> getData() async {
  //   try {
  //     QuerySnapshot snapshot =
  //         await FirebaseFirestore.instance.collection('user').get();
  //     return snapshot.docs
  //         .map((doc) => doc.data() as Map<String, dynamic>)
  //         .toList();
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //     return [];
  //   }
  // }
}
