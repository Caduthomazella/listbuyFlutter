import 'package:flutter/material.dart';

import 'package:list_c/ui/list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      home: ListScreen(),
    );
  }
}
