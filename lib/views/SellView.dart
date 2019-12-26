import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {
  @override
  AddNewItemState createState() => AddNewItemState();
}

class AddNewItemState extends State<AddNewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.close),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Sell',
          style: TextStyle(color: Theme.of(context).primaryColor),
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
