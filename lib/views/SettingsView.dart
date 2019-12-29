import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';

class SettingsView extends StatefulWidget {
  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
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
          'Settingss'.toUpperCase(),
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        actions: [],
      ),
      body: Container(
        color: Colors.black,
        height: 320,
      ),
    );
  }
}
