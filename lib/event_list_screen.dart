import 'package:flutter/material.dart';
import './event_list_item.dart';
import './models/event.dart';
// ignore: unused_import

// ignore: must_be_immutable
class EventListScreen extends StatefulWidget {
  static const routeName = '/event-list';
  Function addEvent;
  Function deleteEvent;
  final List<Event> allEvents;

  EventListScreen(
    this.addEvent,
    this.allEvents,
    this.deleteEvent,
  );

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Event> allEventsList;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  void submitData() {
    if (titleController.text.isEmpty) return;
    final enteredTitle = titleController.text;
    final enteredDescription = descriptionController.text;

    if (enteredTitle.isEmpty || _selectedDate == null || _selectedTime == null)
      return;

    widget.addEvent(
        enteredTitle, enteredDescription, _selectedDate, _selectedTime);

    setState(() {});
    Navigator.of(context).pop();
    _showSubmitToast(context);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 00, minute: 00),
    ).then((pickedTime) {
      if (pickedTime == null) return;
      setState(() {
        _selectedTime = pickedTime;
      });
    });
  }

  void _showSubmitToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('Submitted successfully'),
        action: SnackBarAction(
            label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  ////////////MODAL SHEET////////////////
  void _startAddNewEvent(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    height: 40,
                    child: Text(
                      'Add an Event',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onSubmitted: (_) => submitData(),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    onSubmitted: (_) => submitData(),
                    controller: descriptionController,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          height: 50,
                          color: Colors.black,
                          textColor: Colors.white,
                          child: Text(
                            'Choose Date',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          onPressed: _presentDatePicker,
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          height: 50,
                          color: Colors.black,
                          textColor: Colors.white,
                          child: Text(
                            'Choose Time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          onPressed: _presentTimePicker,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    height: 60,
                    minWidth: 60,
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text(
                      'SUBMIT',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    onPressed: submitData,
                  )
                ],
              ),
            ),
          );
        });
  }
  ///////////////////////MODAL SHEET///////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('All Events'),
        ),
        body: (Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/AppBackGround.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Text(
                  'This is the switch area'), //about 40 units of space max can be allotted
              Container(
                  height: 650,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return EventListItem(
                          widget.allEvents[index], widget.deleteEvent);
                    },
                    itemCount: widget.allEvents.length,
                  )),
            ],
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text('Add new event'),
          foregroundColor: Colors.white,
          onPressed: () => _startAddNewEvent(context),
        ));
  }
}
