import 'package:flutter/material.dart';
import 'package:flutter/src/material/drawer.dart' as flutter;
import 'package:flutter_app/util/route.dart';

class Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listens to the value exposed by counterProvnt ider
    return flutter.Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.book),
            title: Text("患者列表"),
            onTap: () => {pushNamedOrPop(context, '/home')},
          ),
          ListTile(leading: Icon(Icons.book), title: Text("用药")),
          ListTile(leading: Icon(Icons.book), title: Text("绩效")),
          ListTile(leading: Icon(Icons.book), title: Text("知识库")),
        ],
      ),
    );
  }
}
