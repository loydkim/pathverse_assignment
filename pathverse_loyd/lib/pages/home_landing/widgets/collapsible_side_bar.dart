import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

class PathverseCollapsibleSideBar extends StatelessWidget {
  final bool isHideSidebar;
  final List<CollapsibleItem> items;
  final Widget body;
  const PathverseCollapsibleSideBar(
      {super.key,
      required this.isHideSidebar,
      required this.items,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 4.0),
        child: CollapsibleSidebar(
          isCollapsed:
              isHideSidebar ? true : MediaQuery.of(context).size.width <= 800,
          items: items,
          height: isHideSidebar ? 0 : 205,
          collapseOnBodyTap: isHideSidebar ? false : true,
          iconSize: 30,
          minWidth: isHideSidebar ? 0 : 72,
          maxWidth: isHideSidebar ? 0 : 260,
          showTitle: false,
          screenPadding: 8,
          topPadding: 10,
          body: body,
          backgroundColor: Colors.black,
          selectedTextColor: Colors.limeAccent,
          textStyle: const TextStyle(fontSize: 15),
          titleStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          toggleTitleStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          sidebarBoxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 4,
              spreadRadius: 0.01,
              offset: const Offset(0.1, 0.1),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 4,
              spreadRadius: 0.01,
              offset: const Offset(0.1, 0.1),
            ),
          ],
        ),
      ),
    );
  }
}
