import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagescroll/Controller/ImageController.dart';
import 'package:imagescroll/screens/fullImageScreen.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key, required this.title});

  final String title;

  @override
  State<ImageScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ImageScreen> {
  ImageController imageController= ImageController();


  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(

            centerTitle: true,
            title: Text(widget.title),
          ),
          body:

              kIsWeb?      RefreshIndicator(
                  onRefresh: _handleRefresh,
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  child:

                  GetBuilder<ImageController>(
                    init: ImageController(),
                    builder: (s) => s.isLoading.value
                        ? Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: widgetHeight * .06),
                      child: const Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.purple,
                            ),
                          )),
                    )
                        :

                    GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(

                            crossAxisCount: calculateColumnCount(MediaQuery.of(context).size.width),


                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5),
                        itemCount: s.imageScrollResponse.value.hits?.length ?? 0,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(FullScreenImage(
                                  imageUrl: s.imageScrollResponse.value.hits![index].userImageURL.toString(),
                                  tag: s.imageScrollResponse.value.hits?[index].user.toString()??""
                              ));
                              print("myindex" + index.toString());
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(widgetHeight*.01),
                                    //height: widgetHeight*.15,
                                    alignment: Alignment.center,
                                    //color: Colors.grey,
                                    child:
                                    Hero(
                                      tag: s.imageScrollResponse.value.hits?[index].user.toString()??"",
                                      child: CachedNetworkImage(
                                        height: widgetHeight*.1,
                                        imageUrl:s.imageScrollResponse.value.hits![index].userImageURL.toString(),
                                        placeholder:
                                            (context,
                                            url) =>
                                            Container(
                                              margin: EdgeInsets.all(
                                                  widgetHeight *
                                                      .08),
                                              height:
                                              widgetHeight *
                                                  .08,
                                              width:
                                              widgetHeight *
                                                  .07,
                                              child:
                                              CircularProgressIndicator(
                                                strokeWidth:
                                                5,
                                              ),
                                            ),
                                        errorWidget: (context,
                                            url,
                                            error) =>
                                        new Icon(Icons
                                            .error),
                                      ),
                                    )



                                  // Image.asset(s.imageScrollResponse.value.hits![index].userImageURL.toString()),
                                  //Image.network(s.imageScrollResponse.value.hits![index].userImageURL.toString()),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        //height: widgetHeight*.02,
                                        child: Row(
                                            children:[
                                              Image.asset("assets/icons/heart.png",height: widgetHeight*.02,),
                                              Text(s.imageScrollResponse.value.hits?[index].likes.toString()??"",
                                                style: TextStyle(fontSize: textWidth*.02),)
                                            ]

                                        ),
                                      ),
                                      Container(
                                        //height: widgetHeight*.02,
                                        child: Row(
                                            children:[
                                              Image.asset("assets/icons/view.png",height: widgetHeight*.02),
                                              Text(s.imageScrollResponse.value.hits?[index].views.toString()??"",
                                                style: TextStyle(fontSize: textWidth*.02),)
                                            ]

                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                    ),
                  ))
              :
    RefreshIndicator(
    onRefresh: _handleRefresh,
    color: Colors.white,
    backgroundColor: Colors.blue,
    child:

          GetBuilder<ImageController>(
            init: ImageController(),
            builder: (s) => s.isLoading.value
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: widgetHeight * .06),
                    child: const Center(
                        child: SizedBox(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    )),
                  )
                :

            GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5),
                    itemCount: s.imageScrollResponse.value.hits?.length ?? 0,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(FullScreenImage(
                              imageUrl: s.imageScrollResponse.value.hits![index].userImageURL.toString(),
                              tag: s.imageScrollResponse.value.hits?[index].user.toString()??""
                          ));
                          print("myindex" + index.toString());
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(widgetHeight*.01),
                              //height: widgetHeight*.15,
                              alignment: Alignment.center,
                              //color: Colors.grey,
                              child:
                                  Hero(
                                    tag: s.imageScrollResponse.value.hits?[index].user.toString()??"",
                                    child: CachedNetworkImage(
                                      height: widgetHeight*.1,
                                      imageUrl:s.imageScrollResponse.value.hits![index].userImageURL.toString(),
                                      placeholder:
                                          (context,
                                          url) =>
                                          Container(
                                            margin: EdgeInsets.all(
                                                widgetHeight *
                                                    .08),
                                            height:
                                            widgetHeight *
                                                .08,
                                            width:
                                            widgetHeight *
                                                .07,
                                            child:
                                            CircularProgressIndicator(
                                              strokeWidth:
                                              5,
                                            ),
                                          ),
                                      errorWidget: (context,
                                          url,
                                          error) =>
                                      new Icon(Icons
                                          .error),
                                    ),
                                  )



                             // Image.asset(s.imageScrollResponse.value.hits![index].userImageURL.toString()),
                              //Image.network(s.imageScrollResponse.value.hits![index].userImageURL.toString()),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: widgetHeight*.02,
                                    child: Row(
                                      children:[
                                        Image.asset("assets/icons/heart.png",height: widgetHeight*.02,),
                                        Text(s.imageScrollResponse.value.hits?[index].likes.toString()??"",
                                        style: TextStyle(fontSize: textWidth*.03),)
                                      ]

                                    ),
                                  ),
                                  Container(
                                    height: widgetHeight*.02,
                                    child: Row(
                                        children:[
                                          Image.asset("assets/icons/view.png",height: widgetHeight*.02),
                                          Text(s.imageScrollResponse.value.hits?[index].views.toString()??"",
                                            style: TextStyle(fontSize: textWidth*.03),)
                                        ]

                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    ),
          )),




      )
    );
  }





  int calculateColumnCount(double screenWidth) {
    // Adjust these values based on your needs
    const double minWidth = 200.0;
    const int maxColumns = 5;

    int columnCount = (screenWidth / minWidth).floor();


    if (columnCount<=0)
  {
    columnCount++;
    print("coulums"+columnCount.toString());




  }
    print("countss"+columnCount.toString());


    return columnCount > maxColumns ? maxColumns :     columnCount;
  }

  Future<void> _handleRefresh() async {
    // Simulate network fetch or database query
    await Future.delayed(Duration(seconds: 2));
    // Update the list of items and refresh the UI
    setState(() {
      imageController.imageGenerateFun();
      //items = List.generate(20, (index) => "Refreshed Item ${index + 1}");
    });
  }
}

