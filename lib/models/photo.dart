//Todo: This class is partly given. Write the remaining code. Add additional attributes and methods whenever necessary.

class Photo {
  int id;
  String photoUrl, thumbUrl;
  int like, dislike;

  Photo({
    this.id,
    this.photoUrl,
    this.thumbUrl,
    this.like,
    this.dislike,
  });

  Photo.copy(Photo from)
      : this(
            id: from.id,
            photoUrl: from.photoUrl,
            thumbUrl: from.thumbUrl,
            like: from.like,
            dislike: from.dislike);

  Photo.fromJson(Map<String, dynamic> json);
}
