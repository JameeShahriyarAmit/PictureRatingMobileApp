import 'package:final_exam/models/photo.dart';
import 'package:flutter/material.dart';

import 'widgets/reset_button.dart';
import 'widgets/rating.dart';

//Todo: This class is partly given. Write the remaining code. You may want to add additional methods whenever necessary.

class PhotoScreen extends StatefulWidget {
  Photo photo;
  PhotoScreen(this.photo);

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Wrap(
            children: [
              Column(
                children: [
                  Rating(stars: widget.photo.like==0? 0 :((widget.photo.like/(widget.photo.like + widget.photo.dislike))/0.2).toInt(), size: 30.0),
                  Text(
                    '${widget.photo.like} likes out of ${widget.photo.like+widget.photo.dislike} votes',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(height: 10.0),
                  ResetButton(
                    onPressed: () {
                      setState(() {
                          widget.photo.like  = 0;
                          widget.photo.dislike =0;                    
                                            });                      
                    },
                  ),
                  SizedBox(height: 10.0),
                  Image.network(
                    //! image takes long time to load
                    "${widget.photo.photoUrl}",
                    // "https://github.com/jumail-utm/map/blob/main/preview/photo1.jpg?raw=true",
                    fit: BoxFit.fitHeight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
              heroTag:  null,
              onPressed: () => Navigator.pop(context, widget.photo),
              icon: Icon(Icons.check_circle),
              label: Text('Save'),
            ),
    );
  }
}
