import 'package:flutter/material.dart';
import 'package:madlab_project/under_construction.dart';

class NotesCenterCard extends StatelessWidget {
  //
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
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => toUnderConstruction(context),
        splashColor: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.limeAccent.shade700,
                Colors.lightGreen.shade200,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topRight,
            height: 100,
            width: 200,
            child: Text(
              'My NotesCenter',
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
