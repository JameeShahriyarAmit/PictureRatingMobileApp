import 'package:flutter/material.dart';

import 'widgets/thumb_button.dart';

//Todo: This class is partly given. Write the remaining code. Add additional methods whenever necessary.

class PhotolistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemCount: 3,
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
                    count: 3,
                    onPressed: () {},
                  ),
                  SizedBox(width: 15.0), // space between thumb icons
                ],
              ),
            ),
            title: SizedBox(
              // height: 200.0,
              child: Image.network(
                "http://gmm.fc.utm.my/~jumail/preview/photo1.jpg",
                // "https://github.com/jumail-utm/map/blob/main/preview/photo1.jpg?raw=true",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
