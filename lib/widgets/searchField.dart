import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';

TextField searchField(
  TextEditingController searchTextController,
  FocusNode searchFocus,
  bool isSearchInFocus,
  BuildContext context,
  Function clearSearchQuery,
) {
  if (isSearchInFocus) {
    Timer(Duration(milliseconds: 300), () {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }
    });
  }
  return TextField(
    controller: searchTextController,
    focusNode: searchFocus,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          vertical: 2, horizontal: isSearchInFocus ? 8 : 0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
      prefixIcon: !isSearchInFocus
          ? Icon(
              ProIconUI.search,
              color: Theme.of(context).primaryColor,
            )
          : null,
      suffix: isSearchInFocus
          ? InkWell(
              onTap: clearSearchQuery,
              child: Icon(
                ProIconUI.close_fill,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            )
          : null,
      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
      hintText: 'Find items to buy...',
    ),
  );
}
