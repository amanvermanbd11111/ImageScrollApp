

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagescroll/Modal/ImageScrollResponse.dart';
import 'package:imagescroll/data/response/status.dart';
import 'package:imagescroll/modal_view/ImageRepository.dart';

class ImageController extends GetxController{



  var isLoading = false.obs;
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;


  final imageScrollResponse=ImageScrollResponse().obs;
  String key="43412884-57fff6161a400bca55127abbe";
  String q="yellow+flowers";

  String image_type="photo";







  final api =ImageRepository();


  @override
  void onInit() {
    imageGenerateFun();
  }


  void imageGenerateFun() async{


    isLoading(true);
    update();

    var map = new Map<String, dynamic>();
    map['key']=key;
    map['q']=q;
    map['image_type']=image_type;


    api.sendFeedback(map).then((value) {
      rxRequestStatus.value=Status.COMPLETED;
      imageScrollResponse.value=value;
      print("Calculating length of list  "+ imageScrollResponse.value.hits!.length.toString());

      isLoading(false);
      update();
      //
      // if(imageScrollResponse.value!=null) {
      //   if (imageScrollResponse.value.hits != null) {
      //     isLoading(false);
      //
      //     update();
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Message sent Succesfully",
      //
      //       "",
      //       backgroundColor: Colors.green,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //     );
      //     // Get.offAll(FeatureDiscovery(
      //     //   recordStepsInSharedPreferences: false,
      //     //   child: MyHomeScreen(),
      //     // ));
      //     //Get.back();
      //
      //
      //   } else
      //
      //   {
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Something went wrong",
      //
      //       "",
      //       backgroundColor: Colors.green,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //     );
      //   }
      // }
      //
      // else{
      //
      //   Get.snackbar(
      //     // user_login_response.value.message.toString(),
      //     "Something went wrong",
      //
      //     "",
      //     backgroundColor: Colors.green,
      //     forwardAnimationCurve: Curves.easeOutBack,
      //     snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //   );
      // }
      //

    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });

  }

}