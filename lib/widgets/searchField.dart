import 'package:flutter/material.dart';
import 'package:pro1/icons/pro_icons_ui.dart';
import 'package:pro1/widgets/CircleIconButton.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchTextController;
  final FocusNode searchFocus;
  final bool isSearchInFocus;
  const SearchTextField({
    Key key,
    @required this.searchTextController,
    @required this.searchFocus,
    @required this.isSearchInFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      focusNode: searchFocus,
      style: TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            top: 2, bottom: 2, left: isSearchInFocus ? 8 : 0, right: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide:
              BorderSide(color: Theme.of(context).accentColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide:
              BorderSide(color: Theme.of(context).accentColor, width: 2),
        ),
        prefixIcon: !isSearchInFocus
            ? Icon(
                ProIconUI.search,
                color: Theme.of(context).accentColor,
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
        hintStyle:
            TextStyle(color: Theme.of(context).accentColor.withAlpha(200)),
        hintText: 'Find stuff to buy...',
      ),
    );
  }
}
