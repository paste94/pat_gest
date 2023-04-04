/*
import 'package:flutter/material.dart';
import 'package:pat_gest/constants/routes.dart';

class PatGestDrawer extends StatefulWidget {
  final Function(DrawerPage) onSelectPage;
  const PatGestDrawer({super.key, required this.onSelectPage});

  @override
  State<PatGestDrawer> createState() => _PatGestDrawerState();
}

class _PatGestDrawerState extends State<PatGestDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          _buildHeader(context),
          _buildMenuItems(context),
        ],
      ),
    ));
  }

  Widget _buildHeader(BuildContext context) => Container();

  Widget _buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Patients'),
            onTap: () {
              Navigator.pop(context);
              widget.onSelectPage(DrawerPage.patientsList);
            },
          ),
          ListTile(
            leading: const Icon(Icons.computer),
            title: const Text('Offices'),
            onTap: () {
              Navigator.pop(context);
              widget.onSelectPage(DrawerPage.officesList);
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank),
            title: const Text('Foods'),
            onTap: () {
              Navigator.pop(context);
              widget.onSelectPage(DrawerPage.foodList);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Options'),
            onTap: () {
              Navigator.pop(context);
              widget.onSelectPage(DrawerPage.options);
            },
          ),
        ],
      );
}
*/