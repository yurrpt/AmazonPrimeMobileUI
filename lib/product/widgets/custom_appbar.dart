import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({super.key, required this.title, this.actions, this.leading, this.children = const <Widget>[]});
  final String title;
  List<Widget>? actions;
  List<Widget> children = const <Widget>[];
  Widget? leading;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 4.4);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
        color: Constants.appBaColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/png/decor.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          children: [
            AppBar(
              leading: leading,
              actions: actions,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 30, fontFamily: Constants.fontFamily, color: Constants.whiteColor),
              ),
              centerTitle: true,
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
