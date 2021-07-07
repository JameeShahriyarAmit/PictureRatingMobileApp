import 'package:flutter/material.dart';

import 'widgets/reset_button.dart';
import 'widgets/rating.dart';

//Todo: This class is partly given. Write the remaining code. You may want to add additional methods whenever necessary.

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          children: [
            Column(
              children: [
                Rating(stars: 3, size: 30.0),
                Text(
                  'Number of likes should go here',
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(height: 10.0),
                ResetButton(
                  onPressed: () {},
                ),
                SizedBox(height: 10.0),
                Text('Photo image should go here '),
              ],
            )
          ],
        ),
      ),
    );
  }
}
