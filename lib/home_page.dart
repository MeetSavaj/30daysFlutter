import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test_1"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days of $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
