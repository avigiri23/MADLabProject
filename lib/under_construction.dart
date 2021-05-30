import 'package:flutter/material.dart';

class UnderConstruction extends StatefulWidget {
  @override
  _UnderConstructionState createState() => _UnderConstructionState();
}

class _UnderConstructionState extends State<UnderConstruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Oops!!'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/AppBackGround.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://media.giphy.com/media/pb5vjcqyjlLTFP0sxD/giphy.gif',
              height: 200,
              width: 200,
            ),
            Text(
              'This page is under construction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        )),
      ),
    );
  }
}
