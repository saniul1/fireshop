import 'package:flutter/material.dart';

class BrowseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 320,
          )
        ],
      ),
    );
  }
}
