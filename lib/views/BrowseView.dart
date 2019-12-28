import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons.dart';
import 'package:pro1/widgets/CircleIconButton.dart';

class BrowseView extends StatelessWidget {
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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            sectionHeading('Browse Categories'),
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
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            buildProductList(context, title: 'Recommendations'),
            // buildProductList(context, title: 'Trending'),
            // buildProductList(context, title: 'Newest'),
            buildProductList(context, title: 'Browse All', crossAxisCount: 2),
          ],
        ),
      ),
    );
  }

  Column buildProductList(BuildContext context,
      {@required String title, int crossAxisCount = 1}) {
    return Column(
      children: <Widget>[
        sectionHeading(title),
        Container(
          height: crossAxisCount > 1
              ? double.parse('${200 * crossAxisCount}')
              : 250,
          color: Theme.of(context).backgroundColor,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(5),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: crossAxisCount,
            children: List.generate(
              9,
              (i) {
                return GridTile(
                  child: Container(
                    color: Colors.teal[100 * (i + 1)],
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5),
                        ),
                        Center(
                          child: Text(
                            'item-$i',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Padding sectionHeading(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[Text(txt)],
      ),
    );
  }
}
