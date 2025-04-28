import 'package:flutter/material.dart';

class ValleyBoyScreen extends StatelessWidget {
  const ValleyBoyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          valleyBoyCardContent("Valley Boy 1"),
          valleyBoyCardContent("Valley Boy 2"),
          valleyBoyCardContent("Valley Boy 3"),
        ],
      ),
    );
  }

  Widget valleyBoyCardContent(String name) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 4,
      shadowColor: Colors.grey,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            listTileUser(name),
          ],
        ),
      ),
    );
  }

  Widget listTileUser(String name) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
