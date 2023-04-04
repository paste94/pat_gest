import 'package:flutter/material.dart';

/// This class is used to add a fielt to the NavigationRailDestination in order
/// to let it know which page it has to load when it is clicked. It is used
/// to avoid working with indexes in the NavigationRail.
class MyNavigationRailDestination extends NavigationRailDestination {
  final Widget pageToLoad;
  MyNavigationRailDestination({
    required super.icon,
    required super.label,
    required this.pageToLoad,
  });
}
