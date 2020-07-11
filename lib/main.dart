import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/all/all.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0), // in logical pixels
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 1),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 6.0),
            blurRadius: 40.0,
          ),
        ],
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
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Gallai',
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 30,
                  letterSpacing: 4,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Your sexy images will load here',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
