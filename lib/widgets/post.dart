import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:pratice_app/models/ImageDetails.dart';
import 'package:pratice_app/models/ImgurResponse.dart';
import 'package:pratice_app/utils/imgurapi.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

class ImgurItemWidget extends StatefulWidget {
  final ImgurPost imgurPost;

  ImgurItemWidget(Key key, this.imgurPost) : super(key: key);

  @override
  _ImgurItemWidgetState createState() => _ImgurItemWidgetState();
}

class _ImgurItemWidgetState extends State<ImgurItemWidget> {
  Widget post;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void dispose() {
    if (!isNull(_videoPlayerController)) {
      _videoPlayerController.dispose();
    }
    if (!isNull(_chewieController)) {
      _chewieController.dispose();
    }
    super.dispose();
  }

  void init() {
    var isValid = !isNull(widget.imgurPost.images);
    var imageCollection = widget.imgurPost.images;

    if (isValid && isImage(imageCollection[0].type.toString())) {
      post = getImageWidget(widget.imgurPost, post);
    } else if (isValid && isVideo(imageCollection[0].type.toString())) {
      post = getVideoWidget(widget.imgurPost, post);
    } else if (isValid && isImage(widget.imgurPost.type.toString())) {
      post = getImageWidget(widget.imgurPost, post, widget.imgurPost.link);
    } else if (isImage(widget.imgurPost.type.toString())) {
      post = getImageWidget(widget.imgurPost, post, widget.imgurPost.link);
    } else if (isVideo(widget.imgurPost.type.toString())) {
      post = getVideoWidget(widget.imgurPost, post, widget.imgurPost.mp4,
          widget.imgurPost.width, widget.imgurPost.height);
    } else {
      print("**********************************");
      print("********Dummy widget added********");
      print("**********************************");
      // Dummy image widget
      var imgDetails = ImageDetails("http://via.placeholder.com/350x150", 150.0,
          350.0, widget.imgurPost.title);
      post = ImageWidget(
        imageDetails: imgDetails,
        url: imgDetails.imageURL,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    init();

    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.imgurPost.title,
                style: new TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          post,
        ],
      ),
    );
  }

  Widget getImageWidget(ImgurPost imgurPost, Widget post, [String url]) {
    if (isNull(url)) {
      ImageDetails imageDetails = getImageDetails(imgurPost);
      url = imageDetails.imageURL;
      return ImageWidget(
        imageDetails: imageDetails,
        url: url,
      );
    } else {
      return ImageWidget(
        url: url,
        imageDetails: ImageDetails(
          url,
          !isNull(imgurPost.height)
              ? imgurPost.height.toDouble()
              : imgurPost.coverHeight.toDouble(),
          !isNull(imgurPost.width)
              ? imgurPost.width.toDouble()
              : imgurPost.coverWidth.toDouble(),
          imgurPost.description,
        ),
      );
    }
  }

  Widget getVideoWidget(ImgurPost imgurPost, Widget post,
      [String url, int width, int height]) {
    String link = isNull(url) ? imgurPost.images[0].mp4 : url;
    int videoWidth = isNull(width) ? imgurPost.images[0].width : width;
    int videoHeight = isNull(height) ? imgurPost.images[0].height : height;
    _videoPlayerController = VideoPlayerController.network(link);
    _chewieController = new ChewieController(
      videoPlayerController: _videoPlayerController,
      showControls: true,
      autoPlay: false,
      looping: false,
      aspectRatio: videoWidth / videoHeight,
    );

    return VideoWidget(
      chewieController: _chewieController,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final ImageDetails imageDetails;

  final String url;

  const ImageWidget({Key key, this.imageDetails, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: imageDetails.width / imageDetails.height,
        child: new CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.fitWidth,
          placeholder: (context, url) =>
              material.Image.memory(kTransparentImage),
        ),
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  final ChewieController chewieController;

  const VideoWidget({Key key, this.chewieController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}
