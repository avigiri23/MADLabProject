import 'package:flutter/material.dart';
import './models/event.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class EventListItem extends StatelessWidget {
  final Event thisEvent;
  final Function deleteEvent;

  EventListItem(
    this.thisEvent,
    this.deleteEvent,
  );
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.6),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          //color: Colors.white.withOpacity(0.3),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black45, width: 2))),
              alignment: Alignment.centerLeft,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 150,
                    child: FittedBox(
                      child: Text(
                        '${thisEvent.title}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Due at ${thisEvent.time.hour}:${thisEvent.time.minute}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'by ${thisEvent.date.day}/${thisEvent.date.month}/${thisEvent.date.year}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.assignment_turned_in_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: () => deleteEvent(thisEvent),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              child: Text('${thisEvent.description}'),
            ),
          ],
        ),
      ),
    );
  }
}
