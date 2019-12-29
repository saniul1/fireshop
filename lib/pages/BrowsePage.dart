import 'package:flutter/material.dart';
import 'package:pro1/widgets/ProductList.dart';
import 'package:pro1/icons/pro_icons.dart';
import 'package:pro1/widgets/CircleIconButton.dart';

class BrowsePage extends StatelessWidget {
  static const accent = 200;
  final List<Map<String, Object>> _categories = [
    {'icon': ProIcons.bag, 'color': Colors.red[accent], 'name': 'Bags'},
    {'icon': ProIcons.bag, 'color': Colors.teal[accent], 'name': 'Bags'},
    {'icon': ProIcons.bag, 'color': Colors.blue[accent], 'name': 'Bags'},
    {'icon': ProIcons.bag, 'color': Colors.lime[accent], 'name': 'Bags'},
    {'icon': ProIcons.bag, 'color': Colors.yellow[accent], 'name': 'Bags'},
    {'icon': ProIcons.bag, 'color': Colors.amber[accent], 'name': 'Bags'},
    {'icon': ProIcons.bag, 'color': Colors.pink[accent], 'name': 'Bags'},
    // {'icon': ProIcons.bag, 'color': Colors.red[100], 'name': 'Bags'},
    {'icon': ProIcons.go, 'color': Colors.green[accent], 'name': 'more...'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[Text('Browse Categories')],
            ),
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            child: GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 40,
              mainAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: List.generate(
                _categories.length,
                (i) {
                  return Column(
                    children: <Widget>[
                      GridTile(
                        child: CircleIconButton(
                          icon: _categories[i]['icon'],
                          color: _categories[i]['color'],
                          onPressed: () {
                            print(i);
                          },
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                      ),
                      Text(
                        _categories[i]['name'],
                        style: TextStyle(color: Theme.of(context).accentColor),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          ProductList(title: 'Recommendations'),
          // buildProductList(context, title: 'Trending'),
          // buildProductList(context, title: 'Newest'),
          // ProductList(title: 'Browse All', crossAxisCount: 2),
        ],
      ),
    );
  }
}
