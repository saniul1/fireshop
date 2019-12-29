import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';

class NotificationView extends StatefulWidget {
  @override
  NotificationViewState createState() => NotificationViewState();
}

class NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                ProIconUI.close_fill,
                size: 16,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Notifications'.toUpperCase(),
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        actions: [],
      ),
      body: Container(
        color: Colors.lime,
        height: 320,
      ),
    );
  }
}
