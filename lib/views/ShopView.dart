import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  final TabController tabController;
  ShopView({@required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: List.generate(tabController.length, (i) {
        final colors = [Colors.amber, Colors.purple, Colors.teal];
        return Card(color: colors[i]);
      }),
    );
  }
}
