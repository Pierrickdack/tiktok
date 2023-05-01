import 'package:flutter/material.dart';

class AddVideoPage extends StatelessWidget {
  const AddVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 190,
            height: 50,
            decoration: const BoxDecoration(color: Colors.green),
            child: const Center(
              child: Text(
                'Add video',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
