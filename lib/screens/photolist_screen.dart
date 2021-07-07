import 'package:final_exam/models/photo.dart';
import 'package:final_exam/screens/photo_screen.dart';
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
  final PhotoService photoService = dependency();
  

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
            leading: Visibility(
              visible: _photos[index].allowDuplicate!=0,
              child: IconButton(
                  icon: Icon(Icons.copy_rounded, color: Colors.green),
                  onPressed: () async{
                    final PhotoService photoService = dependency();
                    final duplicatePhoto = await photoService.createPhotos(
                      photo: Photo(photoUrl: _photos[index].photoUrl, thumbUrl: _photos[index].thumbUrl, like: 0, dislike: 0, allowReset: 0, allowDuplicate: 0 )
                    );
                    setState(() => _photos.add(duplicatePhoto));
                  }),
            ),
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
                    onPressed:() async{
                      final PhotoService photoService = dependency();
                      Photo updatedPhoto = await photoService.updateLike(
                        id: _photos[index].id,
                        likeNo: _photos[index].like +1,
                      );
                      setState(() => _photos[index].like = updatedPhoto.like);
                    },
                  ),
                  SizedBox(width: 15.0),
                  ThumbButton(
                    icon: Icons.thumb_down, // Icons.thumb_down,
                    size: 25.0,
                    color: Colors.red, // Colors.red,
                    count: _photos[index].dislike,
                    onPressed: () async{
                      final PhotoService photoService = dependency();
                      Photo updatedNewPhoto = await photoService.updateDislike(
                        id: _photos[index].id,
                        dislikeNo: _photos[index].dislike +1,
                      );
                      setState(() => _photos[index].dislike = updatedNewPhoto.dislike);
                    },
                  ),
                   // space between thumb icons
                ],
              ),
            ),
            title: Column(
              children: [
                SizedBox(
                  // height: 200.0,
                  child: Image.network(
                    "${_photos[index].thumbUrl}",
                    // "https://github.com/jumail-utm/map/blob/main/preview/photo1.jpg?raw=true",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            onTap: () async{
              Photo returnData = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => PhotoScreen(_photos[index])));
              print(returnData);

        if(returnData == null){}
    else{    
          setState(()=> _photos[index]= returnData);
          final PhotoService photoService = dependency();

          Photo updatedPhoto = await photoService.updateLike(
                        id: _photos[index].id,
                        likeNo: returnData.like,
                      );
          setState(() => _photos[index].like = updatedPhoto.like);
          Photo updatedNewPhoto = await photoService.updateDislike(
                        id: _photos[index].id,
                        dislikeNo: returnData.dislike,
                      );
           setState(() => _photos[index].dislike = updatedNewPhoto.dislike);
    }
            },
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