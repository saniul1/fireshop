import 'package:flutter/material.dart';
import 'package:pro1/widgets/appBar.dart';
import 'package:pro1/widgets/bottomNavbar.dart';
import 'package:pro1/views/AccountView.dart';
import 'package:pro1/views/ShopView.dart';
import 'package:pro1/views/ChatsView.dart';
import 'package:pro1/views/BrowseView.dart';
import 'package:pro1/views/SellView.dart';
import 'package:pro1/icons/pro_icons_ui.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedView = 0;
  FocusNode _seacrhFocusNode = FocusNode();
  final TextEditingController _searchTextController = TextEditingController();

  List<Map<String, Object>> _tabViews = [
    {'icon': ProIconUI.grid, 'name': 'Browse'},
    {'icon': ProIconUI.messages, 'name': 'Chats'},
    {'icon': ProIconUI.bag, 'name': 'Shop'},
    {'icon': ProIconUI.user, 'name': 'Account'},
  ];
  List<Widget> _views;

  static final List<Tab> _chatTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Buyers'),
    Tab(text: 'Sellers'),
  ];
  static final List<Tab> _shopTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Buying'),
    Tab(text: 'Selling'),
  ];

  TabController _chatTabController;
  TabController _shopTabController;

  var _isSearchInFocus = false;
  void _onSearchFocusChange() {
    setState(() {
      _isSearchInFocus = _seacrhFocusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    _seacrhFocusNode.addListener(_onSearchFocusChange);
    _searchTextController.text = '';
    _chatTabController = TabController(vsync: this, length: _chatTabs.length);
    _shopTabController = TabController(vsync: this, length: _shopTabs.length);
    _views = [
      BrowseView(),
      ChatsView(
        tabController: _chatTabController,
      ),
      ShopView(
        tabController: _shopTabController,
      ),
      AccountView()
    ];
  }

  @override
  void dispose() {
    _chatTabController.dispose();
    _shopTabController.dispose();
    _seacrhFocusNode.removeListener(_onSearchFocusChange);
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
      resizeToAvoidBottomPadding: false,
      appBar: buildAppBar(
        context,
        _selectedView,
        _isSearchInFocus,
        chatTabController: _chatTabController,
        chatTabs: _chatTabs,
        shopTabController: _shopTabController,
        shopTabs: _shopTabs,
        tabViews: _tabViews,
        searchFocus: _seacrhFocusNode,
        searchTextController: _searchTextController,
      ),
      body: _views[_selectedView],
      bottomNavigationBar: BottomNavBar(
        centerItemText: 'SELL',
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _changeView,
        items: _tabViews.map((tab) {
          return BottomNavBarItem(
              iconData: tab["icon"],
              text: (tab['name'] as String).toUpperCase());
        }).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _openSellItemView,
        child: Icon(
          ProIconUI.plus,
          color: Theme.of(context).bottomAppBarColor,
        ),
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
        fullscreenDialog: true,
      ),
    );
  }
}
