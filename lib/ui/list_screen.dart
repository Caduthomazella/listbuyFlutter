import 'package:flutter/material.dart';
import 'package:list_c/models/Item.dart';
import 'package:list_c/ui/add.item.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.add_shopping_cart)),
            ),
            title: Text(
              item.title,
              style: TextStyle(color: Colors.blueGrey),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }

  void _addItem() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AddItem();
        });
  }
}
