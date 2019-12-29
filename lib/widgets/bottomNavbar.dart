import 'package:flutter/material.dart';

class BottomNavBarItem {
  BottomNavBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<BottomNavBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 13,
                fontFamily: 'Roboto Condensed',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    BottomNavBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index
        ? Theme.of(context).primaryColor
        : Theme.of(context).accentColor;
    return Expanded(
      child: Material(
        color: _selectedIndex == index
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onPressed(index),
          child: SizedBox(
            height: widget.height,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Padding(
                  padding: const EdgeInsets.all(2),
                ),
                Text(
                  item.text,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontFamily: 'Roboto Condensed',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
