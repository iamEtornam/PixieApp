class Photo{
  String largeImageURL;
  String webformatHeight;
  String webformatWidth;
  String likes;
  String imageWidth;
  String id;
  String user_id;
  String views;
  String comments;
  String pageURL;
  String imageHeight;
  String webformatURL;
  String type;
  String previewHeight;
  String tags;
  String downloads;
  String user;
  String favorites;
  String imageSize;
  String previewWidth;
  String userImageURL;
  String previewURL;

  Photo({
    this.largeImageURL,this.webformatHeight,this.webformatWidth,this.likes,this.imageWidth,this.id,this.user_id,this.views,this.comments,this.pageURL,this.imageHeight,this.webformatURL,this.type,this.previewHeight,this.tags,this.downloads,this.user,this.favorites,this.imageSize,this.previewWidth,this.userImageURL,this.previewURL,
  });

  static Photo fromJson(Map<String,dynamic> json){
    return Photo(
      largeImageURL: json['largeImageURL'],
      webformatHeight: json['webformatHeight'],
      webformatWidth: json['webformatWidth'],
      likes: json['likes'],
      imageWidth: json['imageWidth'],
      id: json['id'],
      user_id: json['user_id'],
      views: json['views'],
      comments: json['comments'],
      pageURL: json['pageURL'],
      imageHeight: json['imageHeight'],
      webformatURL: json['webformatURL'],
      type: json['type'],
      previewHeight: json['previewHeight'],
      tags: json['tags'],
      downloads: json['downloads'],
      user: json['user'],
      favorites: json['favorites'],
      imageSize: json['imageSize'],
      previewWidth: json['previewWidth'],
      userImageURL: json['userImageURL'],
      previewURL: json['previewURL'],
    );
  }

  Map<String, dynamic> toJson() => {
    'largeImageURL': largeImageURL,
    'webformatHeight': webformatHeight,
    'webformatWidth': webformatWidth,
    'likes': likes,
    'imageWidth': imageWidth,
    'id': id,
    'user_id': user_id,
    'views': views,
    'comments': comments,
    'pageURL': pageURL,
    'imageHeight': imageHeight,
    'webformatURL': webformatURL,
    'type': type,
    'previewHeight': previewHeight,
    'tags': tags,
    'downloads': downloads,
    'user': user,
    'favorites': favorites,
    'imageSize': imageSize,
    'previewWidth': previewWidth,
    'userImageURL': userImageURL,
    'previewURL': previewURL,
  };
}
