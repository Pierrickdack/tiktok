import 'package:flutter/material.dart';

class HoomePage extends StatelessWidget {
  HoomePage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _section(),
      ),
    );
  }

  Widget _section() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      //child: DropdownButton,
    );
  }
}
