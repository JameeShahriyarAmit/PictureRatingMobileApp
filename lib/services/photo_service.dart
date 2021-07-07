import '../dependencies.dart';
import 'rest_service.dart';
import '../models/photo.dart';

//Todo: This class is partly given. Write the remaining code. Add additional attributes and methods whenever necessary.

class PhotoService {
  final RestService rest = dependency();

  Future<List<Photo>> getPhotos() async {
    final listJson = await rest.get('photos');

    return (listJson as List)
        .map((itemJson) => Photo.fromJson(itemJson))
        .toList();
  }

  Future<Photo> createPhotos({Photo photo}) async {
    final json = await rest.post('photos', data: photo);
    return Photo.fromJson(json);
  }

  Future<Photo> updateLike({int id, int likeNo}) async {
    final json = await rest.patch('photos/$id', data: {'like': likeNo});
    return Photo.fromJson(json);
  }

  Future<Photo> updateDislike({int id, int dislikeNo}) async {
    final json = await rest.patch('photos/$id', data: {'dislike': dislikeNo});
    return Photo.fromJson(json);
  }

}
