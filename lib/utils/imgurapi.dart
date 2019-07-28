import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:pratice_app/models/ImageDetails.dart';
import 'package:pratice_app/models/ImgurResponse.dart';

const String base = "https://api.imgur.com/3";

bool isNull(dynamic value) {
  return value == null;
}

bool isImage(String postType) {
  postType = postType.toLowerCase();
  return postType.contains("png") ||
      postType.contains("gif") ||
      postType.contains("jpeg") ||
      postType.contains("jpg") ||
      postType.contains("image");
}

bool isGif(String postType) {
  postType = postType.toLowerCase();
  return postType.contains("gif");
}

bool isVideo(String postType) {
  postType = postType.toLowerCase();
  return postType.contains("mp4") || postType.contains("video");
}

Future<ImgurResponse> getMostPopular([int page = 0]) async {
  try {
    var url = "$base/gallery/hot/viral/$page";
    print(url);
    // Await the http get response, then decode the json-formatted responce.
    var response = await http
        .get(url, headers: {"Authorization": "Client-ID fefcc0dc5e80d51"});
    if (response.statusCode == 200) {
      return ImgurResponse.fromJson(convert.jsonDecode(response.body));
    } else {
      return null;
    }
  } catch (e) {
    print(e);
  }
}

ImageDetails getImageDetails(ImgurPost imgurPost) {
  if (!isNull(imgurPost.images) &&
      !isNull(imgurPost.images[0]) &&
      isImage(imgurPost.images[0].type.toString())) {
    var image = imgurPost.images[0];
    var url;
    if (isGif(image.type.toString())) {
      url = image.gifv.replaceAll(".gifv", '.gif');
    } else {
      url = image.link;
    }

    return ImageDetails(
        url, image.height.toDouble(), image.width.toDouble(), imgurPost.title);
  } else {
    return ImageDetails(
        "http://via.placeholder.com/350x150", 150.0, 350.0, imgurPost.title);
  }
}
