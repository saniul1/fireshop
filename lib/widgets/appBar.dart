import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';
import 'package:pro1/views/NotificationView.dart';
import 'package:pro1/views/SettingsView.dart';
import 'package:pro1/widgets/badge.dart';
import 'package:pro1/widgets/SearchField.dart';

class AppBarPro extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPro(
    this.selectedView, {
    Key key,
    @required this.isSearchInFocus,
    @required this.chatTabController,
    @required this.chatTabs,
    @required this.shopTabController,
    @required this.shopTabs,
    @required this.tabViews,
    @required this.searchFocus,
    @required this.searchTextController,
  }) : super(key: key);
  final int selectedView;
  final bool isSearchInFocus;
  final TabController chatTabController;
  final List<Tab> chatTabs;
  final TabController shopTabController;
  final List<Tab> shopTabs;
  final List<Map<String, Object>> tabViews;
  final FocusNode searchFocus;
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    var _chatTabBar = TabBar(
      indicatorWeight: 3.0,
      labelColor: Theme.of(context).accentColor,
      indicatorColor: Theme.of(context).accentColor,
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
      labelColor: Theme.of(context).accentColor,
      indicatorColor: Theme.of(context).accentColor,
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
                    child: SearchTextField(
                      searchTextController: searchTextController,
                      searchFocus: searchFocus,
                      isSearchInFocus: isSearchInFocus,
                    ),
                  ),
                ),
                if (!isSearchInFocus)
                  Badge(
                    value: '0',
                    child: IconButton(
                      color: Theme.of(context).accentColor,
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
                color: Theme.of(context).accentColor,
              ),
            ),
      actions: <Widget>[
        if (selectedView == 3)
          IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(
              ProIconUI.settings,
            ),
            onPressed: _openSettingsView,
          )
      ],
      bottom: selectedView == 1 || selectedView == 2
          ? selectedView == 1 ? _chatTabBar : _shopTabBar
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      selectedView == 1 || selectedView == 2 ? 80 : kToolbarHeight);
}
