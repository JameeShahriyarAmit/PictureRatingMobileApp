//Todo: This class is partly given. Write the remaining code. Add additional attributes and methods whenever necessary.

class Photo {
  int id;
  String photoUrl, thumbUrl;
  int like, dislike;
  int allowReset;
  int allowDuplicate;

  Photo({
    this.id,
    this.photoUrl,
    this.thumbUrl,
    this.like,
    this.dislike,
    this.allowReset,
    this.allowDuplicate
  });

  Photo.copy(Photo from)
      : this(
            id: from.id,
            photoUrl: from.photoUrl,
            thumbUrl: from.thumbUrl,
            like: from.like,
            dislike: from.dislike,
            allowReset: from.allowReset,
            allowDuplicate: from.allowDuplicate,
            );

  Photo.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], 
             photoUrl: json['photoUrl'],
             thumbUrl: json['thumbUrl'],
             like: json['like'],
             dislike: json['dislike'],
             allowReset: json['allowReset'],
             allowDuplicate: json['allowDuplicate'],
             );

  Map<String, dynamic> toJson() =>{
    'id' : id,
    'photoUrl' : photoUrl,
    'thumbUrl' : thumbUrl,
    'like' : like,
    'dislike' : dislike,
    'allowReset' : allowReset,
    'allowDuplicate' : allowDuplicate,
  } ;          
}
