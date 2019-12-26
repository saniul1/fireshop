import 'package:flutter/material.dart';
import 'package:pro1/bottomNavbar.dart';
import 'package:pro1/views/AccountView.dart';
import 'package:pro1/views/ShopView.dart';
import 'package:pro1/views/ChatsView.dart';
import 'package:pro1/views/BrowseView.dart';
import 'package:pro1/views/SellView.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedView = 0;
  List<Map<String, Object>> _tabViews = [
    {'icon': Icons.home, 'name': 'Browse'},
    {'icon': Icons.chat, 'name': 'Chats'},
    {'icon': Icons.shop, 'name': 'Shop'},
    {'icon': Icons.people, 'name': 'Account'},
  ];
  List<Widget> _views;

  static final List<Tab> _chatTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Buyers'),
    Tab(text: 'Sellers'),
  ];
  static final List<Tab> _cartTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Buying'),
    Tab(text: 'Selling'),
  ];

  TabController _chatTabController;
  TabController _cartTabController;

  @override
  void initState() {
    super.initState();
    _chatTabController = TabController(vsync: this, length: _chatTabs.length);
    _cartTabController = TabController(vsync: this, length: _cartTabs.length);
    _views = [BrowseView(), ChatsView(), ShopView(), AccountView()];
  }

  @override
  void dispose() {
    _chatTabController.dispose();
    super.dispose();
  }

  void _changeView(int index) {
    setState(() {
      _selectedView = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: _views[_selectedView],
      bottomNavigationBar: BottomNavBar(
          centerItemText: 'Sell',
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _changeView,
          items: _tabViews.map((tab) {
            return BottomNavBarItem(iconData: tab["icon"], text: tab['name']);
          }).toList()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _openSellItemView,
        child: Icon(Icons.add),
        elevation: 2.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openSellItemView() {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return AddNewItem();
          },
          fullscreenDialog: true),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var _chatTabBar = TabBar(
      indicatorWeight: 3.0,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Theme.of(context).textTheme.title.color,
      controller: _chatTabController,
      onTap: (a) {},
      tabs: _chatTabs.map((tab) {
        return Tab(
          text: tab.text,
        );
      }).toList(),
    );
    var _cartTabBar = TabBar(
      indicatorWeight: 3.0,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Theme.of(context).textTheme.title.color,
      controller: _cartTabController,
      onTap: (a) {},
      tabs: _cartTabs.map((tab) {
        return Tab(
          text: tab.text,
        );
      }).toList(),
    );
    return AppBar(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      elevation: 0,
      title: _selectedView == 0
          ? TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                hintText: 'Search...',
              ),
            )
          : Text(
              _tabViews[_selectedView]['name'],
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
      actions: <Widget>[
        if (_selectedView == 0)
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
      ],
      bottom: _selectedView == 1
          ? PreferredSize(
              preferredSize:
                  Size.fromHeight(_chatTabBar.preferredSize.height - 10),
              child: _chatTabBar,
            )
          : _selectedView == 2
              ? PreferredSize(
                  preferredSize:
                      Size.fromHeight(_cartTabBar.preferredSize.height - 10),
                  child: _cartTabBar,
                )
              : null,
    );
  }
}
