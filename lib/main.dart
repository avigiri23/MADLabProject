import 'package:flutter/material.dart';
import 'package:madlab_project/models/event.dart';
// ignore: unused_import
import './event_list_screen.dart';
import './current_date.dart';
import './calendar_card.dart';
import './notes_center_card.dart';
import './update_center_card.dart';
import './imp_events_list.dart';
import './prioritised_banner.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
              // ignore: deprecated_member_use
              body1: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
                fontSize: 20,
              ),
            ),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          textTheme: ThemeData.light().textTheme.copyWith(
                // ignore: deprecated_member_use
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        //EventListScreen.routeName: (ctx) =>EventListScreen(),
      },
    );
  }
}

////////////////////////////////////////////////////////////////////

final List<Event> _eventList = [
  Event(
    date: DateTime(2021, 05, 28),
    description: 'Labs 0-4 upload file',
    priority: 1,
    time: TimeOfDay(hour: 15, minute: 06),
    title: 'WCC Submission',
  ),
  Event(
    date: DateTime(2021, 05, 24),
    description: 'Resubmit assignment',
    priority: 0,
    time: TimeOfDay(hour: 17, minute: 45),
    title: 'TESD Submission',
  ),
  Event(
    date: DateTime(2021, 05, 22),
    description: 'Agarwal sir\'s session',
    priority: 1,
    time: TimeOfDay(hour: 14, minute: 30),
    title: 'Placement Talk',
  ),
  Event(
    date: DateTime(2021, 05, 22),
    description: 'Event logger app',
    priority: 1,
    time: TimeOfDay(hour: 11, minute: 0),
    title: 'MAD Lab project',
  ),
  Event(
    date: DateTime(2021, 05, 21),
    description: '',
    priority: 0,
    time: TimeOfDay(hour: 16, minute: 15),
    title: 'NP&ACN assignment',
  ),
  Event(
    date: DateTime(2021, 05, 10),
    description: '',
    priority: 1,
    time: TimeOfDay(hour: 16, minute: 45),
    title: 'EEFM assignment',
  ),
  Event(
    date: DateTime(2021, 04, 30),
    description: 'Group Study',
    priority: 1,
    time: TimeOfDay(hour: 17, minute: 00),
    title: 'Dinner Date',
  ),
  Event(
    date: DateTime(2021, 04, 30),
    description: 'App made by 2 and a half men',
    priority: 1,
    time: TimeOfDay(hour: 00, minute: 00),
    title: '<Easter Egg> ',
  ),
  Event(
    date: DateTime(2021, 04, 15),
    description: '',
    priority: 1,
    time: TimeOfDay(hour: 18, minute: 00),
    title: 'NS Lab Eval',
  ),
  Event(
    date: DateTime(2021, 04, 01),
    description: 'Why should we even be having to do this',
    priority: 1,
    time: TimeOfDay(hour: 12, minute: 30),
    title: 'EndSem Protest',
  ),
];

/////////////////////////////////////////////////////////////////////
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  void addEvent(String title, String description, DateTime chosenDate,
      TimeOfDay chosenTime) {
    final newEv = Event(
      title: title,
      description: description,
      date: chosenDate,
      time: chosenTime,
    );
    setState(() {
      _eventList.insertAll(0, [newEv]);
    });
  }

  void deleteEvent(Event item) {
    setState(() {
      _eventList.remove(item);
    });
    Navigator.of(context).pop();
    _showDeleteToast(context);
  }

  void _showDeleteToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade400,
        content: Text('Deleted successfully'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: scaffold.hideCurrentSnackBar,
          textColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text('SemPlanner'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/AppBackGround.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            CurrentDate(), //Current Date
            Container(
              width: double.infinity,
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CalendarCard(), //Calendar
                  Column(
                    children: [
                      NotesCenterCard(), //Notes Center
                      UpdateCenterCard(
                          _eventList, addEvent, deleteEvent), //Update Center
                    ],
                  ),
                ],
              ),
            ),
            PrioritisedBanner(_eventList, addEvent, deleteEvent),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              height: 180,
              //color: Colors.blue,
              child: ImpEventsList(_eventList),
            ),
          ],
        ),
      ),
    );
  }
}
