import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _items = List<String>.generate(20, (i) => "Likes ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final String item = _items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (DismissDirection yonalish) {
                setState(() {
                  this._items.removeAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(yonalish == DismissDirection.startToEnd
                        ? '$item removed'
                        : '$item liked'),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          setState(() {
                            this._items.insert(index, item);
                          });
                        }),
                  ));
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(dir=DismissDirection.startToEnd?'$item removed':'$item liked',)))
                });
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: Icon(Icons.thumb_down),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                child: Icon(Icons.thumb_up),
              ),
              child: ListTile(
                title: Center(
                  child: Text(_items[index]),
                ),
              ),
            );
          }),
    );
  }
}
