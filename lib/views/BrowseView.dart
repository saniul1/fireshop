import 'package:flutter/material.dart';
import 'package:pro1/pages/BrowsePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BrowseView extends StatefulWidget {
  @override
  _BrowseViewState createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  var _delay = true;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0)).then(((_) {
      setState(() {
        _delay = false;
      });
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: _delay
          ? SpinKitPulse(color: Theme.of(context).primaryColor)
          : BrowsePage(),
    );
  }
}
