import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';
import 'package:pro1/widgets/CircleIconButton.dart';

TextField searchField(
  TextEditingController searchTextController,
  FocusNode searchFocus,
  bool isSearchInFocus,
  BuildContext context,
) {
  if (isSearchInFocus) {
    // NOTE: Increase delay duration to fix any keyboard closing problem.
    Future.delayed(Duration(milliseconds: 300)).then((_) {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        FocusScope.of(context).unfocus();
      }
    });
  }
  return TextField(
    controller: searchTextController,
    focusNode: searchFocus,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(
          top: 2, bottom: 2, left: isSearchInFocus ? 8 : 0, right: 0),
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
      suffixIcon: isSearchInFocus
          ? CircleIconButton(
              icon: ProIconUI.close_fill,
              size: 25,
              color: Colors.transparent,
              onPressed: () => {
                Future.delayed(Duration(milliseconds: 50)).then((_) {
                  searchTextController.clear();
                  // FocusScope.of(context).unfocus();
                })
              },
            )
          : null,
      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
      hintText: 'Find items to buy...',
    ),
  );
}
