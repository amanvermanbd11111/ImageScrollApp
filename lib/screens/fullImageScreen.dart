import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenImage extends StatefulWidget {
  final String imageUrl;
  final String tag;

  const FullScreenImage({ required this.imageUrl, required this.tag});

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
              margin: EdgeInsets.only(top: widgetHeight*.03,
              bottom: widgetHeight*.04,
                  right: textWidth*.02),
                alignment: Alignment.topRight,
                child:Icon(Icons.close,size: widgetHeight*.04,
                color: Colors.white,) ,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: widgetHeight*.05),
              child: Center(
                child: Hero(
                  tag: widget.tag,
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    //height: widgetHeight,
                    fit: BoxFit.contain,
                    imageUrl: widget.imageUrl,
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}