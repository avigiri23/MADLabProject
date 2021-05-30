import 'package:flutter/material.dart';
import 'package:madlab_project/models/event.dart';
import './event_list_screen.dart';

class PrioritisedBanner extends StatelessWidget {
  //
  //
  final List<Event> eventList;
  final Function addEvent;
  final Function deleteEvent;

  PrioritisedBanner(this.eventList, this.addEvent, this.deleteEvent);
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
      padding: EdgeInsets.only(
        bottom: 10,
        left: 10,
        right: 10,
        top: 5,
      ),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Your prioritised events',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      InkWell(
                        splashColor: Colors.white,
                        radius: 5,
                        onTap: () => toEventList(context),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
