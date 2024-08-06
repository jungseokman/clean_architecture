import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text('menu1'),
        Text('menu2'),
        Text('menu3'),
      ],
    );
  }
}
