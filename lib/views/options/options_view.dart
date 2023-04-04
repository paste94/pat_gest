import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pat_gest/utils/pat_gest_drawer.dart';

class OptionsView extends StatefulWidget {
  const OptionsView({super.key});

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('OPTIONS'),
    );
  }
}
