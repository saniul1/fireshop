import 'package:flutter/material.dart';
import 'package:pro1/views/ProductDetail.dart';
import 'package:pro1/widgets/CircleIconButton.dart';

class ProductList extends StatelessWidget {
  final String title;
  final int crossAxisCount;
  const ProductList({Key key, @required this.title, this.crossAxisCount = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[Text(title)],
          ),
        ),
        Container(
          height: crossAxisCount > 1
              ? double.parse('${200 * crossAxisCount}')
              : 250,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: crossAxisCount,
            children: List.generate(
              9,
              (i) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductDetail('$title-$i'),
                    ),
                  ),
                  child: Card(
                    elevation: 0.5,
                    child: GridTile(
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd, // all centered
                        children: <Widget>[
                          Hero(
                            tag: '$title-$i',
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
                              fit: BoxFit.cover,
                            ),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
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
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'adadasdasdfadaf Item-$i',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
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
}
