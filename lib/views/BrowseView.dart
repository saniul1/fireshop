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
          // color: Theme.of(context).backgroundColor,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            // padding: const EdgeInsets.all(5),
            // crossAxisSpacing: 0,
            // mainAxisSpacing: 0,
            crossAxisCount: crossAxisCount,
            children: List.generate(
              9,
              (i) {
                return Card(
                  elevation: 0.5,
                  child: GridTile(
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd, // all centered
                      children: <Widget>[
                        Image.network(
                          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleIconButton(
                            icon: Icons.favorite_border,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    footer: GridTileBar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      title: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.gps_fixed,
                                  color: Colors.black45,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                ),
                                Text(
                                  'It\'s a long text',
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\$45',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        'adadasdasdfadaf Item-$i',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
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
