import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final tabs = [
    Center(child: Icon(Icons.home)),
    Center(child: Icon(Icons.search)),
    Center(child: Icon(Icons.camera)),
    Center(child: Icon(Icons.person)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Homepage"),
        leading: GestureDetector(
          onTap: () => logout().whenComplete(() => Navigator.pop(context)),
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
      ),
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("search"),
              backgroundColor: Colors.red,
              tooltip: "search",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text("camera"),
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("profile"),
              backgroundColor: Colors.yellow,
            )
          ],
          onTap: (val) {
            setState(() {
              index = val;
            });
          }),
    );
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
