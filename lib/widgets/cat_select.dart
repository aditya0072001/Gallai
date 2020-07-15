import 'package:flutter/material.dart';

class CategoricalSelector extends StatefulWidget {
  static of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<CategoricalSelectorState>()
      : context.findAncestorStateOfType<CategoricalSelectorState>();
  @override
  CategoricalSelectorState createState() => CategoricalSelectorState();
}

class CategoricalSelectorState extends State<CategoricalSelector> {
  int selectedIndex = 0;
  final List<String> categories = ["All", "Person", "Screenshot", "Memes"];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.0,
        color: Colors.red,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: index == selectedIndex
                          ? Colors.white
                          : Colors.white60,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              );
            }));
  }
}
