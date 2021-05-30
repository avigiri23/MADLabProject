import 'package:flutter/material.dart';
import './under_construction.dart';

class CalendarCard extends StatelessWidget {
  void toUnderConstruction(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (ctx) => UnderConstruction(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5, top: 10, left: 10, right: 10),
      child: InkWell(
        splashColor: Colors.white,
        onTap: () => toUnderConstruction(context),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber.shade800,
                Colors.amber.shade500,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            height: 260,
            width: 200,
            child: Text(
              'View My Calendar',
              style: TextStyle(
                fontSize: 30,
              ),
              softWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
