// To parse this JSON data, do
//
//     final imgurResponse = imgurResponseFromJson(jsonString);

import 'dart:convert';

ImgurResponse imgurResponseFromJson(String str) =>
    ImgurResponse.fromJson(json.decode(str));

String imgurResponseToJson(ImgurResponse data) => json.encode(data.toJson());

class ImgurResponse {
  List<ImgurPost> data;
  bool success;
  int status;

  ImgurResponse({
    this.data,
    this.success,
    this.status,
  });

  factory ImgurResponse.fromJson(Map<String, dynamic> json) =>
      new ImgurResponse(
        data: json["data"] == null
            ? null
            : new List<ImgurPost>.from(json["data"].map((x) => ImgurPost.fromJson(x))),
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : new List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success == null ? null : success,
        "status": status == null ? null : status,
      };
}

class ImgurPost {
  String id;
  String title;
  String description;
  int datetime;
  String cover;
  int coverWidth;
  int coverHeight;
  String accountUrl;
  int accountId;
  Privacy privacy;
  Layout layout;
  int views;
  String link;
  int ups;
  int downs;
  int points;
  int score;
  bool isAlbum;
  dynamic vote;
  bool favorite;
  bool nsfw;
  Section section;
  int commentCount;
  int favoriteCount;
  Topic topic;
  int topicId;
  int imagesCount;
  bool inGallery;
  bool isAd;
  List<Tag> tags;
  int adType;
  String adUrl;
  bool inMostViral;
  bool includeAlbumAds;
  List<Image> images;
  AdConfig adConfig;
  Type type;
  bool animated;
  int width;
  int height;
  int size;
  int bandwidth;
  bool hasSound;
  int edited;
  int mp4Size;
  String mp4;
  String gifv;
  String hls;
  Processing processing;
  bool looping;

  ImgurPost({
    this.id,
    this.title,
    this.description,
    this.datetime,
    this.cover,
    this.coverWidth,
    this.coverHeight,
    this.accountUrl,
    this.accountId,
    this.privacy,
    this.layout,
    this.views,
    this.link,
    this.ups,
    this.downs,
    this.points,
    this.score,
    this.isAlbum,
    this.vote,
    this.favorite,
    this.nsfw,
    this.section,
    this.commentCount,
    this.favoriteCount,
    this.topic,
    this.topicId,
    this.imagesCount,
    this.inGallery,
    this.isAd,
    this.tags,
    this.adType,
    this.adUrl,
    this.inMostViral,
    this.includeAlbumAds,
    this.images,
    this.adConfig,
    this.type,
    this.animated,
    this.width,
    this.height,
    this.size,
    this.bandwidth,
    this.hasSound,
    this.edited,
    this.mp4Size,
    this.mp4,
    this.gifv,
    this.hls,
    this.processing,
    this.looping,
  });

  factory ImgurPost.fromJson(Map<String, dynamic> json) => new ImgurPost(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        datetime: json["datetime"] == null ? null : json["datetime"],
        cover: json["cover"] == null ? null : json["cover"],
        coverWidth: json["cover_width"] == null ? null : json["cover_width"],
        coverHeight: json["cover_height"] == null ? null : json["cover_height"],
        accountUrl: json["account_url"] == null ? null : json["account_url"],
        accountId: json["account_id"] == null ? null : json["account_id"],
        privacy:
            json["privacy"] == null ? null : privacyValues.map[json["privacy"]],
        layout:
            json["layout"] == null ? null : layoutValues.map[json["layout"]],
        views: json["views"] == null ? null : json["views"],
        link: json["link"] == null ? null : json["link"],
        ups: json["ups"] == null ? null : json["ups"],
        downs: json["downs"] == null ? null : json["downs"],
        points: json["points"] == null ? null : json["points"],
        score: json["score"] == null ? null : json["score"],
        isAlbum: json["is_album"] == null ? null : json["is_album"],
        vote: json["vote"],
        favorite: json["favorite"] == null ? null : json["favorite"],
        nsfw: json["nsfw"] == null ? null : json["nsfw"],
        section:
            json["section"] == null ? null : sectionValues.map[json["section"]],
        commentCount:
            json["comment_count"] == null ? null : json["comment_count"],
        favoriteCount:
            json["favorite_count"] == null ? null : json["favorite_count"],
        topic: json["topic"] == null ? null : topicValues.map[json["topic"]],
        topicId: json["topic_id"] == null ? null : json["topic_id"],
        imagesCount: json["images_count"] == null ? null : json["images_count"],
        inGallery: json["in_gallery"] == null ? null : json["in_gallery"],
        isAd: json["is_ad"] == null ? null : json["is_ad"],
        tags: json["tags"] == null
            ? null
            : new List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        adType: json["ad_type"] == null ? null : json["ad_type"],
        adUrl: json["ad_url"] == null ? null : json["ad_url"],
        inMostViral:
            json["in_most_viral"] == null ? null : json["in_most_viral"],
        includeAlbumAds: json["include_album_ads"] == null
            ? null
            : json["include_album_ads"],
        images: json["images"] == null
            ? null
            : new List<Image>.from(
                json["images"].map((x) => Image.fromJson(x))),
        adConfig: json["ad_config"] == null
            ? null
            : AdConfig.fromJson(json["ad_config"]),
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        animated: json["animated"] == null ? null : json["animated"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        size: json["size"] == null ? null : json["size"],
        bandwidth: json["bandwidth"] == null ? null : json["bandwidth"],
        hasSound: json["has_sound"] == null ? null : json["has_sound"],
        edited: json["edited"] == null ? null : json["edited"],
        mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
        mp4: json["mp4"] == null ? null : json["mp4"],
        gifv: json["gifv"] == null ? null : json["gifv"],
        hls: json["hls"] == null ? null : json["hls"],
        processing: json["processing"] == null
            ? null
            : Processing.fromJson(json["processing"]),
        looping: json["looping"] == null ? null : json["looping"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "datetime": datetime == null ? null : datetime,
        "cover": cover == null ? null : cover,
        "cover_width": coverWidth == null ? null : coverWidth,
        "cover_height": coverHeight == null ? null : coverHeight,
        "account_url": accountUrl == null ? null : accountUrl,
        "account_id": accountId == null ? null : accountId,
        "privacy": privacy == null ? null : privacyValues.reverse[privacy],
        "layout": layout == null ? null : layoutValues.reverse[layout],
        "views": views == null ? null : views,
        "link": link == null ? null : link,
        "ups": ups == null ? null : ups,
        "downs": downs == null ? null : downs,
        "points": points == null ? null : points,
        "score": score == null ? null : score,
        "is_album": isAlbum == null ? null : isAlbum,
        "vote": vote,
        "favorite": favorite == null ? null : favorite,
        "nsfw": nsfw == null ? null : nsfw,
        "section": section == null ? null : sectionValues.reverse[section],
        "comment_count": commentCount == null ? null : commentCount,
        "favorite_count": favoriteCount == null ? null : favoriteCount,
        "topic": topic == null ? null : topicValues.reverse[topic],
        "topic_id": topicId == null ? null : topicId,
        "images_count": imagesCount == null ? null : imagesCount,
        "in_gallery": inGallery == null ? null : inGallery,
        "is_ad": isAd == null ? null : isAd,
        "tags": tags == null
            ? null
            : new List<dynamic>.from(tags.map((x) => x.toJson())),
        "ad_type": adType == null ? null : adType,
        "ad_url": adUrl == null ? null : adUrl,
        "in_most_viral": inMostViral == null ? null : inMostViral,
        "include_album_ads": includeAlbumAds == null ? null : includeAlbumAds,
        "images": images == null
            ? null
            : new List<dynamic>.from(images.map((x) => x.toJson())),
        "ad_config": adConfig == null ? null : adConfig.toJson(),
        "type": type == null ? null : typeValues.reverse[type],
        "animated": animated == null ? null : animated,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "size": size == null ? null : size,
        "bandwidth": bandwidth == null ? null : bandwidth,
        "has_sound": hasSound == null ? null : hasSound,
        "edited": edited == null ? null : edited,
        "mp4_size": mp4Size == null ? null : mp4Size,
        "mp4": mp4 == null ? null : mp4,
        "gifv": gifv == null ? null : gifv,
        "hls": hls == null ? null : hls,
        "processing": processing == null ? null : processing.toJson(),
        "looping": looping == null ? null : looping,
      };
}

class AdConfig {
  List<SafeFlag> safeFlags;
  List<String> highRiskFlags;
  List<UnsafeFlag> unsafeFlags;
  bool showsAds;

  AdConfig({
    this.safeFlags,
    this.highRiskFlags,
    this.unsafeFlags,
    this.showsAds,
  });

  factory AdConfig.fromJson(Map<String, dynamic> json) => new AdConfig(
        safeFlags: json["safeFlags"] == null
            ? null
            : new List<SafeFlag>.from(
                json["safeFlags"].map((x) => safeFlagValues.map[x])),
        highRiskFlags: json["highRiskFlags"] == null
            ? null
            : new List<String>.from(json["highRiskFlags"].map((x) => x)),
        unsafeFlags: json["unsafeFlags"] == null
            ? null
            : new List<UnsafeFlag>.from(
                json["unsafeFlags"].map((x) => unsafeFlagValues.map[x])),
        showsAds: json["showsAds"] == null ? null : json["showsAds"],
      );

  Map<String, dynamic> toJson() => {
        "safeFlags": safeFlags == null
            ? null
            : new List<dynamic>.from(
                safeFlags.map((x) => safeFlagValues.reverse[x])),
        "highRiskFlags": highRiskFlags == null
            ? null
            : new List<dynamic>.from(highRiskFlags.map((x) => x)),
        "unsafeFlags": unsafeFlags == null
            ? null
            : new List<dynamic>.from(
                unsafeFlags.map((x) => unsafeFlagValues.reverse[x])),
        "showsAds": showsAds == null ? null : showsAds,
      };
}

enum SafeFlag {
  ALBUM,
  IN_GALLERY,
  ONSFW_MOD_SAFE,
  GALLERY,
  SHARE,
  SIXTH_MOD_SAFE,
  PAGE_LOAD
}

final safeFlagValues = new EnumValues({
  "album": SafeFlag.ALBUM,
  "gallery": SafeFlag.GALLERY,
  "in_gallery": SafeFlag.IN_GALLERY,
  "onsfw_mod_safe": SafeFlag.ONSFW_MOD_SAFE,
  "page_load": SafeFlag.PAGE_LOAD,
  "share": SafeFlag.SHARE,
  "sixth_mod_safe": SafeFlag.SIXTH_MOD_SAFE
});

enum UnsafeFlag { ONSFW_MOD_UNSAFE, SIXTH_UNMOD }

final unsafeFlagValues = new EnumValues({
  "onsfw_mod_unsafe": UnsafeFlag.ONSFW_MOD_UNSAFE,
  "sixth_unmod": UnsafeFlag.SIXTH_UNMOD
});

class Image {
  String id;
  dynamic title;
  String description;
  int datetime;
  Type type;
  bool animated;
  int width;
  int height;
  int size;
  int views;
  int bandwidth;
  dynamic vote;
  bool favorite;
  dynamic nsfw;
  dynamic section;
  dynamic accountUrl;
  dynamic accountId;
  bool isAd;
  bool inMostViral;
  bool hasSound;
  List<dynamic> tags;
  int adType;
  String adUrl;
  String edited;
  bool inGallery;
  String link;
  dynamic commentCount;
  dynamic favoriteCount;
  dynamic ups;
  dynamic downs;
  dynamic points;
  dynamic score;
  String mp4;
  String gifv;
  String hls;
  int mp4Size;
  bool looping;
  Processing processing;

  Image({
    this.id,
    this.title,
    this.description,
    this.datetime,
    this.type,
    this.animated,
    this.width,
    this.height,
    this.size,
    this.views,
    this.bandwidth,
    this.vote,
    this.favorite,
    this.nsfw,
    this.section,
    this.accountUrl,
    this.accountId,
    this.isAd,
    this.inMostViral,
    this.hasSound,
    this.tags,
    this.adType,
    this.adUrl,
    this.edited,
    this.inGallery,
    this.link,
    this.commentCount,
    this.favoriteCount,
    this.ups,
    this.downs,
    this.points,
    this.score,
    this.mp4,
    this.gifv,
    this.hls,
    this.mp4Size,
    this.looping,
    this.processing,
  });

  factory Image.fromJson(Map<String, dynamic> json) => new Image(
        id: json["id"] == null ? null : json["id"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        datetime: json["datetime"] == null ? null : json["datetime"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        animated: json["animated"] == null ? null : json["animated"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        size: json["size"] == null ? null : json["size"],
        views: json["views"] == null ? null : json["views"],
        bandwidth: json["bandwidth"] == null ? null : json["bandwidth"],
        vote: json["vote"],
        favorite: json["favorite"] == null ? null : json["favorite"],
        nsfw: json["nsfw"],
        section: json["section"],
        accountUrl: json["account_url"],
        accountId: json["account_id"],
        isAd: json["is_ad"] == null ? null : json["is_ad"],
        inMostViral:
            json["in_most_viral"] == null ? null : json["in_most_viral"],
        hasSound: json["has_sound"] == null ? null : json["has_sound"],
        tags: json["tags"] == null
            ? null
            : new List<dynamic>.from(json["tags"].map((x) => x)),
        adType: json["ad_type"] == null ? null : json["ad_type"],
        adUrl: json["ad_url"] == null ? null : json["ad_url"],
        edited: json["edited"] == null ? null : json["edited"],
        inGallery: json["in_gallery"] == null ? null : json["in_gallery"],
        link: json["link"] == null ? null : json["link"],
        commentCount: json["comment_count"],
        favoriteCount: json["favorite_count"],
        ups: json["ups"],
        downs: json["downs"],
        points: json["points"],
        score: json["score"],
        mp4: json["mp4"] == null ? null : json["mp4"],
        gifv: json["gifv"] == null ? null : json["gifv"],
        hls: json["hls"] == null ? null : json["hls"],
        mp4Size: json["mp4_size"] == null ? null : json["mp4_size"],
        looping: json["looping"] == null ? null : json["looping"],
        processing: json["processing"] == null
            ? null
            : Processing.fromJson(json["processing"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title,
        "description": description == null ? null : description,
        "datetime": datetime == null ? null : datetime,
        "type": type == null ? null : typeValues.reverse[type],
        "animated": animated == null ? null : animated,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "size": size == null ? null : size,
        "views": views == null ? null : views,
        "bandwidth": bandwidth == null ? null : bandwidth,
        "vote": vote,
        "favorite": favorite == null ? null : favorite,
        "nsfw": nsfw,
        "section": section,
        "account_url": accountUrl,
        "account_id": accountId,
        "is_ad": isAd == null ? null : isAd,
        "in_most_viral": inMostViral == null ? null : inMostViral,
        "has_sound": hasSound == null ? null : hasSound,
        "tags":
            tags == null ? null : new List<dynamic>.from(tags.map((x) => x)),
        "ad_type": adType == null ? null : adType,
        "ad_url": adUrl == null ? null : adUrl,
        "edited": edited == null ? null : edited,
        "in_gallery": inGallery == null ? null : inGallery,
        "link": link == null ? null : link,
        "comment_count": commentCount,
        "favorite_count": favoriteCount,
        "ups": ups,
        "downs": downs,
        "points": points,
        "score": score,
        "mp4": mp4 == null ? null : mp4,
        "gifv": gifv == null ? null : gifv,
        "hls": hls == null ? null : hls,
        "mp4_size": mp4Size == null ? null : mp4Size,
        "looping": looping == null ? null : looping,
        "processing": processing == null ? null : processing.toJson(),
      };
}

class Processing {
  Status status;

  Processing({
    this.status,
  });

  factory Processing.fromJson(Map<String, dynamic> json) => new Processing(
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : statusValues.reverse[status],
      };
}

enum Status { COMPLETED }

final statusValues = new EnumValues({"completed": Status.COMPLETED});

enum Type { IMAGE_PNG, IMAGE_GIF, IMAGE_JPEG, VIDEO_MP4 }

final typeValues = new EnumValues({
  "image/gif": Type.IMAGE_GIF,
  "image/jpeg": Type.IMAGE_JPEG,
  "image/png": Type.IMAGE_PNG,
  "video/mp4": Type.VIDEO_MP4
});

enum Layout { BLOG }

final layoutValues = new EnumValues({"blog": Layout.BLOG});

enum Privacy { HIDDEN, PUBLIC }

final privacyValues =
    new EnumValues({"hidden": Privacy.HIDDEN, "public": Privacy.PUBLIC});

enum Section { EMPTY, WHOLESOMEGIFS, MEMES }

final sectionValues = new EnumValues({
  "": Section.EMPTY,
  "memes": Section.MEMES,
  "wholesomegifs": Section.WHOLESOMEGIFS
});

class Tag {
  String name;
  String displayName;
  int followers;
  int totalItems;
  bool following;
  bool isWhitelisted;
  String backgroundHash;
  String thumbnailHash;
  String accent;
  bool backgroundIsAnimated;
  bool thumbnailIsAnimated;
  bool isPromoted;
  String description;
  dynamic logoHash;
  dynamic logoDestinationUrl;
  DescriptionAnnotations descriptionAnnotations;

  Tag({
    this.name,
    this.displayName,
    this.followers,
    this.totalItems,
    this.following,
    this.isWhitelisted,
    this.backgroundHash,
    this.thumbnailHash,
    this.accent,
    this.backgroundIsAnimated,
    this.thumbnailIsAnimated,
    this.isPromoted,
    this.description,
    this.logoHash,
    this.logoDestinationUrl,
    this.descriptionAnnotations,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => new Tag(
        name: json["name"] == null ? null : json["name"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        followers: json["followers"] == null ? null : json["followers"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
        following: json["following"] == null ? null : json["following"],
        isWhitelisted:
            json["is_whitelisted"] == null ? null : json["is_whitelisted"],
        backgroundHash:
            json["background_hash"] == null ? null : json["background_hash"],
        thumbnailHash:
            json["thumbnail_hash"] == null ? null : json["thumbnail_hash"],
        accent: json["accent"] == null ? null : json["accent"],
        backgroundIsAnimated: json["background_is_animated"] == null
            ? null
            : json["background_is_animated"],
        thumbnailIsAnimated: json["thumbnail_is_animated"] == null
            ? null
            : json["thumbnail_is_animated"],
        isPromoted: json["is_promoted"] == null ? null : json["is_promoted"],
        description: json["description"] == null ? null : json["description"],
        logoHash: json["logo_hash"],
        logoDestinationUrl: json["logo_destination_url"],
        descriptionAnnotations: json["description_annotations"] == null
            ? null
            : DescriptionAnnotations.fromJson(json["description_annotations"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "display_name": displayName == null ? null : displayName,
        "followers": followers == null ? null : followers,
        "total_items": totalItems == null ? null : totalItems,
        "following": following == null ? null : following,
        "is_whitelisted": isWhitelisted == null ? null : isWhitelisted,
        "background_hash": backgroundHash == null ? null : backgroundHash,
        "thumbnail_hash": thumbnailHash == null ? null : thumbnailHash,
        "accent": accent == null ? null : accent,
        "background_is_animated":
            backgroundIsAnimated == null ? null : backgroundIsAnimated,
        "thumbnail_is_animated":
            thumbnailIsAnimated == null ? null : thumbnailIsAnimated,
        "is_promoted": isPromoted == null ? null : isPromoted,
        "description": description == null ? null : description,
        "logo_hash": logoHash,
        "logo_destination_url": logoDestinationUrl,
        "description_annotations": descriptionAnnotations == null
            ? null
            : descriptionAnnotations.toJson(),
      };
}

class DescriptionAnnotations {
  DescriptionAnnotations();

  factory DescriptionAnnotations.fromJson(Map<String, dynamic> json) =>
      new DescriptionAnnotations();

  Map<String, dynamic> toJson() => {};
}

enum Topic { NO_TOPIC }

final topicValues = new EnumValues({"No Topic": Topic.NO_TOPIC});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
