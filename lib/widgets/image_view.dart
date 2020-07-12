import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:gallary/widgets/image_view.dart';
import 'package:image_gallery/image_gallery.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  final String title;
  ImageView({this.imagePath, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.file(
                File(imagePath.toString()),
                height: 500,
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton.icon(
                  onPressed: () async {
                    try {
                      final ByteData bytes = await rootBundle.load(imagePath);
                      await WcFlutterShare.share(
                          sharePopupTitle: 'share',
                          subject: 'Image sharing',
                          text: 'Shared from gallai app',
                          fileName: 'title',
                          mimeType: 'image/png',
                          bytesOfFile: bytes.buffer.asUint8List());
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  icon: Icon(Icons.share),
                  label: Text(''),
                  color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
