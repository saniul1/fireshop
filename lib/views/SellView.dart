import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';

class AddNewItem extends StatefulWidget {
  @override
  AddNewItemState createState() => AddNewItemState();
}

class AddNewItemState extends State<AddNewItem> {
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
          'Sell'.toUpperCase(),
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        actions: [],
      ),
      body: Container(
        color: Colors.amber,
        height: 320,
      ),
    );
  }
}
