import 'dart:convert' as convert;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:http/http.dart' as http;
import 'package:pratice_app/models/ImgurResponse.dart';
import 'package:transparent_image/transparent_image.dart';

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

double convertUnits(double value, BuildContext context) {
  return value / MediaQuery.of(context).devicePixelRatio;
}

Widget getPostCard(ImgurPost imgurPost, BuildContext context) {
  ImageDetails imageDetails = getImageDetails(imgurPost);
  var url = imageDetails.imageURL;
  return Card(
    margin: EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              imageDetails.description,
              style: new TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          height: convertUnits(imageDetails.height, context),
          padding: EdgeInsets.all(4.0),
          child: CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) =>
                material.Image.memory(kTransparentImage),
          ),
        ),
        Container(
          padding: EdgeInsets.all(4.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              url,
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Future<ImgurResponse> getMostPopular() async {
  try {
    var url = "$base/gallery/hot/viral";
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
        "http://via.placeholder.com/350x150", 150.0, 150.0, imgurPost.title);
  }
}

class ImageDetails {
  String imageURL;
  double height;
  double width;
  String description;

  ImageDetails(this.imageURL, this.height, this.width, this.description);
}
