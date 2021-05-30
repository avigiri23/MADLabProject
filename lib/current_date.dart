import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentDate extends StatelessWidget {
  final DateTime currentDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.black, Colors.black.withOpacity(0.3)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 2,
                ),
                child: Text(
                  'Today is',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 2,
                  right: 20,
                  bottom: 10,
                ),
                width: double.infinity,
                child: Text(
                  DateFormat.d().add_MMMM().add_y().format(currentDateTime),
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
