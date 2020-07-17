//import 'dart:convert';

import 'package:gallary/widgets/image_view.dart';
import 'package:image_gallery/image_gallery.dart';
//import 'package:gallary/models/modell.dart';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

//import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';

class All extends StatefulWidget {
  final String category;
  const All({this.category});
  @override
  _AllState createState() => new _AllState(this.category);
}

class _AllState extends State<All> {
  Map<dynamic, dynamic> allImageInfo = new HashMap();
  String category;
  //Timer timer;
  List allImage = new List();
  List allNameList = new List();
  _AllState(this.category);
  @override
  void initState() {
    super.initState();
    loadImageList();
  }

  Future<void> loadImageList() async {
    loadModel();
    Map<dynamic, dynamic> allImageTemp;
    allImageTemp = await FlutterGallaryPlugin.getAllImages;

    setState(() {
      if (category.isNotEmpty && category == '0') {
        this.allImage = allImageTemp['URIList'] as List;
        this.allNameList = allImageTemp['DISPLAY_NAME'] as List;
        //recognizeImage(allImageTemp['URIList'] as List, 2);
      } else if (category.isNotEmpty && category == '2') {
        recognizeImage(allImage, 2);
      } else if (category.isNotEmpty && category == '3') {
        recognizeImage(allImage, 1);
      } else if (category.isNotEmpty && category == '4') {
        recognizeImage(allImage, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      child: _buildGrid(),
    );
  }

  Widget _buildGrid() {
    return GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(allImage.length));
  }

  List<Container> _buildGridTileList(int count) {
    return List<Container>.generate(
        count,
        (int index) => Container(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageView(
                              imagePath: allImage[index].toString(),
                              title: allNameList[index].toString(),
                            )));
              },
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      File(allImage[index].toString()),
                      width: 96.0,
                      height: 96.0,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )));
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      useGpuDelegate: true,
    );
  }

  recognizeImage(List images, int choice) async {
    var tempImg = new List<String>.from(images);
    String i;
    if (choice == 1) {
      for (i in images) {
        if (i.isNotEmpty) {
          try {
            var recognition = await Tflite.runModelOnImage(
              path: i,
              numResults: 3,
              threshold: 0.01,
              imageMean: 0.0,
              imageStd: 255.0,
            );
            if (recognition[0]["confidence"] * 100 > 50) {
            } else {
              tempImg.remove(i);
            }
          } catch (e) {}
        }
      }
    } else if (choice == 2) {
      for (i in images) {
        if (i.isNotEmpty) {
          try {
            var recognition = await Tflite.runModelOnImage(
              path: i,
              numResults: 3,
              threshold: 0.01,
              imageMean: 0.0,
              imageStd: 255.0,
            );
            print(recognition);
            if (recognition[0]["confidence"] * 100 > 50) {
            } else {
              tempImg.remove(i);
            }
          } catch (e) {}
        }
      }
    } else if (choice == 3) {
      for (i in images) {
        if (i.isNotEmpty) {
          try {
            var recognition = await Tflite.runModelOnImage(
              path: i,
              numResults: 3,
              threshold: 0.01,
              imageMean: 0.0,
              imageStd: 255.0,
            );
            if (recognition[0]["confidence"] * 100 > 50) {
            } else {
              tempImg.remove(i);
            }
          } catch (e) {}
        }
      }
    }
    setState(() {
      this.allImage = tempImg;
    });
  }
}
