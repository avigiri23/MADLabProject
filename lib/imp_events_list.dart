import 'package:flutter/material.dart';
import 'package:madlab_project/models/event.dart';

class ImpEventsList extends StatelessWidget {
  final List<Event> _eventList;

  ImpEventsList(this._eventList);
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          color: Colors.white.withOpacity(0.5),
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade400,
                child: Icon(
                  Icons.alarm_rounded,
                  color: Colors.red.shade900,
                ),
              ),
              title: Text(
                '${_eventList[index].title}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
      itemCount: 4,
    );
  }
}
