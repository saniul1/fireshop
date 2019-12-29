import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String id;
  ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Container(
        child: Hero(
          tag: id,
          child: Image.network(
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
