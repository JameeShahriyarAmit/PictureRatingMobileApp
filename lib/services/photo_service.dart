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
}
