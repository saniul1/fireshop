import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';
import 'package:pro1/views/NotificationView.dart';
import 'package:pro1/views/SettingsView.dart';
import 'package:pro1/widgets/badge.dart';
import 'package:pro1/widgets/searchField.dart';

AppBar buildAppBar(
  BuildContext context,
  int selectedView,
  bool isSearchInFocus, {
  @required TabController chatTabController,
  @required List<Tab> chatTabs,
  @required TabController shopTabController,
  @required List<Tab> shopTabs,
  @required List<Map<String, Object>> tabViews,
  @required FocusNode searchFocus,
  @required TextEditingController searchTextController,
}) {
  // Chat Tabs
  var _chatTabBar = TabBar(
    indicatorWeight: 3.0,
    labelColor: Theme.of(context).primaryColor,
    indicatorColor: Theme.of(context).primaryColor,
    labelStyle: Theme.of(context).appBarTheme.textTheme.subtitle,
    controller: chatTabController,
    onTap: (a) {
      print(a);
    },
    tabs: chatTabs.map((tab) {
      return Tab(
        text: tab.text.toUpperCase(),
      );
    }).toList(),
  );

  // shop Tabs
  var _shopTabBar = TabBar(
    indicatorWeight: 3.0,
    labelColor: Theme.of(context).primaryColor,
    indicatorColor: Theme.of(context).primaryColor,
    labelStyle: Theme.of(context).appBarTheme.textTheme.subtitle,
    controller: shopTabController,
    onTap: (a) {},
    tabs: shopTabs.map((tab) {
      return Tab(
        text: tab.text.toUpperCase(),
      );
    }).toList(),
  );

  void _openNotificationView() {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return NotificationView();
        },
        fullscreenDialog: true,
      ),
    );
  }

  void _openSettingsView() {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return SettingsView();
        },
        fullscreenDialog: true,
      ),
    );
  }

  return AppBar(
    elevation: 0.5,
    titleSpacing: selectedView == 0 ? 0 : 12,
    title: selectedView == 0
        ? Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: searchField(
                    searchTextController,
                    searchFocus,
                    isSearchInFocus,
                    context,
                  ),
                ),
              ),
              if (!isSearchInFocus)
                Badge(
                  value: '0',
                  child: IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      ProIconUI.bell,
                      size: 20,
                    ),
                    onPressed: _openNotificationView,
                  ),
                ),
            ],
          )
        : Text(
            (tabViews[selectedView]['name'] as String).toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
    actions: <Widget>[
      if (selectedView == 3)
        IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(
            ProIconUI.settings,
          ),
          onPressed: _openSettingsView,
        )
    ],
    bottom: selectedView == 1 || selectedView == 2
        ? PreferredSize(
            preferredSize:
                Size.fromHeight(_chatTabBar.preferredSize.height - 20),
            child: selectedView == 1 ? _chatTabBar : _shopTabBar,
          )
        : null,
  );
}
