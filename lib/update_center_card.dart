import 'package:flutter/material.dart';
import './event_list_screen.dart';
import './models/event.dart';

class UpdateCenterCard extends StatelessWidget {
  final List<Event> eventList;
  final Function addEvent;
  final Function deleteEvent;

  UpdateCenterCard(this.eventList, this.addEvent, this.deleteEvent);

  void toEventList(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (ctx) => EventListScreen(addEvent, eventList, deleteEvent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => toEventList(context),
        splashColor: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo.shade900,
                Colors.indigo.shade200,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            height: 100,
            width: 200,
            child: Text(
              'Update Center',
              style: TextStyle(
                fontSize: 28,
              ),
              softWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
