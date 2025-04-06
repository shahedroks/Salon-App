import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({super.key});

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}




class _UsersHomePageState extends State<UsersHomePage> {



  Future<List<Map<String, dynamic>>> getData() async {
    try {
      // 'users' collection থেকে ডেটা
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('user').get();

      // ডেটা তালিকা হিসেবে ফিরিয়ে দেয়া
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Data'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getData(), // getData() কল করা
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found.'));
          }

          // ডেটা প্রদর্শন
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var user = snapshot.data![index];
              return ListTile(
                title: Text(user['name'] ?? 'No Name'),
                subtitle: Text(user['email'] ?? 'No Email'),
              );
            },
          );
        },
      ),
    );
  }
}
