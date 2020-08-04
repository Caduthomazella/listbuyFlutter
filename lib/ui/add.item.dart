import 'package:flutter/material.dart';
import 'package:list_c/models/Item.dart';

class AddItem extends StatelessWidget {
  final itemC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Item'),
      content: TextField(
        autofocus: true,
        controller: itemC,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text('Adicionar'),
          onPressed: () {
            final item = new Item(title: this.itemC.text);
            itemC.clear();

            Navigator.of(context).pop(item);
          },
        ),
      ],
    );
  }
}
