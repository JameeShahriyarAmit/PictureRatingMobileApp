import 'package:final_exam/models/photo.dart';
import 'package:final_exam/services/photo_service.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';
import 'widgets/thumb_button.dart';

//Todo: This class is partly given. Write the remaining code. Add additional methods whenever necessary.

class PhotolistScreen extends StatefulWidget {
  @override
  _PhotolistScreenState createState() => _PhotolistScreenState();
}

class _PhotolistScreenState extends State<PhotolistScreen> {
  List <Photo> _photos;

  @override
  

  Widget build(BuildContext context) {
      final PhotoService photoService = dependency();

       return FutureBuilder<List<Photo>>(
        future: photoService.getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _photos = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });

  }


   Scaffold _buildMainScreen() {
      return Scaffold(
        body: ListView.separated(
          itemCount: _photos.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.blueGrey,
          ),
          itemBuilder: (context, index) => ListTile(
            leading: IconButton(
                icon: Icon(Icons.copy_rounded, color: Colors.green),
                onPressed: () {}),
            trailing: SizedBox(
              width: 180.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ThumbButton(
                    icon: Icons.thumb_up, // Icons.thumb_down,
                    size: 25.0,
                    color: Colors.green, // Colors.red,
                    count: _photos[index].like,
                    onPressed: () {},
                  ),
                  SizedBox(width: 15.0),
                  ThumbButton(
                    icon: Icons.thumb_down, // Icons.thumb_down,
                    size: 25.0,
                    color: Colors.red, // Colors.red,
                    count: _photos[index].dislike,
                    onPressed: () {},
                  ),
                   // space between thumb icons
                ],
              ),
            ),
            title: SizedBox(
              // height: 200.0,
              child: Image.network(
                "${_photos[index].thumbUrl}",
                // "https://github.com/jumail-utm/map/blob/main/preview/photo1.jpg?raw=true",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      );
   }
  

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }
    
    
}