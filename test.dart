import 'package:flutter/material.dart';

class test extends StatefulWidget {
  test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  int selectedIndex_ = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            buildBottomNavBar_(Icons.home, 0),
            buildBottomNavBar_(Icons.photo, 1),
            buildBottomNavBar_(Icons.fullscreen, 2),
            buildBottomNavBar_(Icons.poll, 3),
            buildBottomNavBar_(Icons.account_box, 4),
          ],
        ),
        appBar: AppBar(),
        drawer: Drawer(),
        body: Center(
            child: Text(
          "hello from $selectedIndex_",
          style: TextStyle(fontSize: 50),
        )));
  }

  GestureDetector buildBottomNavBar_(IconData iconData, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex_ = index;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 5,
        child: Icon(
          iconData,
          color: selectedIndex_ == index ? Colors.green : Colors.grey[400],
          size: 25,
        ),
        decoration: selectedIndex_ == index
            ? BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 2, color: Colors.green)),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.015)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              )
            : BoxDecoration(color: Colors.white),
      ),
    );
  }
}
