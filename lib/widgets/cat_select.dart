import 'package:flutter/material.dart';

class CategoricalSelector extends StatefulWidget {
  final customFunction;
  static of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<CategoricalSelectorState>()
      : context.findAncestorStateOfType<CategoricalSelectorState>();
  @override
  CategoricalSelector({Key key, this.customFunction}) : super(key: key);
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
                    this.selectedIndex = index;
                    widget.customFunction(this.selectedIndex);
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

  getSelectedIndex() {
    return this.selectedIndex;
  }
}
