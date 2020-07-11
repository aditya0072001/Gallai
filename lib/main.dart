import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/all/all.dart';
import 'widgets/cat_select.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      //margin: EdgeInsets.symmetric(horizontal: 10.0), // in logical pixels
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 1),
      decoration: BoxDecoration(
        color: Colors.red,
        //borderRadius: BorderRadius.horizontal(
        //    left: Radius.elliptical(20, 20), right: Radius.elliptical(20, 20)),
      ),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      color: Colors.red,
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Gallai',
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  letterSpacing: 5,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CategoricalSelector(),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
          )),
          All()
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Gallai', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
