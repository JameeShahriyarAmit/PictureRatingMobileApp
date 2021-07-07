import '../dependencies.dart';
import '../services/photo_service.dart';
import '../models/photo.dart';
import 'viewmodel.dart';

//Todo: This class is partly given. Write the remaining code. Add additional attributes and methods whenever necessary.

class PhotoViewmodel extends Viewmodel {
  PhotoService get _service => dependency();
  List<Photo> _photos; // The list of photos

  void getPhotos() async {
    turnBusy();
    _photos = await _service.getPhotos();
    turnIdle();
  }
}
