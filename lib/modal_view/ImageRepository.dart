
import 'package:imagescroll/Modal/ImageScrollResponse.dart';
import 'package:imagescroll/data/network/network_api_services.dart';

class ImageRepository
{
  final  _apinetwork=NetworkApiServices();

  Future<ImageScrollResponse>sendFeedback(Map<String, dynamic> map) async
  {
    dynamic response =await  _apinetwork.getApi("https://pixabay.com/api/?key=43412884-57fff6161a400bca55127abbe&q=yellow+flowers&image_type=photo");
    return ImageScrollResponse.fromJson(response);
  }
}