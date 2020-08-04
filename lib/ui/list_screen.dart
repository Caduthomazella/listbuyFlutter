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
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.blueGrey,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    item.isDone ? Colors.blueAccent : Colors.blueGrey,
                child: IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: Icon(item.isDone ? Icons.done : Icons.shop)),
              ),
              title: Text(
                item.title,
                style: TextStyle(color: Colors.blueGrey),
              ),
              onTap: () {
                setState(() {
                  items[index].isDone = !items[index].isDone;
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }

  void _addItem() async {
    final item = await showDialog<Item>(
        context: context,
        builder: (BuildContext context) {
          return new AddItem();
        });

    setState(() {
      items.add(item);
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      items.sort((a, b) {
        if (a.isDone && !b.isDone)
          return 1;
        else if (!a.isDone && b.isDone) return -1;
        return 0;
      });
    });

    return Future.value();
  }
}
