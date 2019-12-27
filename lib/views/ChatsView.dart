import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  final TabController tabController;
  ChatsView({@required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: List.generate(tabController.length, (i) {
        final colors = [Colors.green, Colors.yellow, Colors.blue];
        return Card(color: colors[i]);
      }),
    );
  }
}
