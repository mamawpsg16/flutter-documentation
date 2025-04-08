import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLitePage extends StatefulWidget {
  const SQLitePage({super.key});

  @override
  _SQLitePageState createState() => _SQLitePageState();
}

class _SQLitePageState extends State<SQLitePage> {
  late Database database;
  final TextEditingController _controller = TextEditingController();
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  Future<void> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'local_items.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)');
      },
    );

    _loadItems();
  }

  Future<void> _loadItems() async {
    final List<Map<String, dynamic>> maps = await database.query('items');
    setState(() {
      items = List.generate(maps.length, (i) => maps[i]['name']);
    });
  }

  Future<void> _addItem(String name) async {
    await database.insert('items', {'name': name});
    _controller.clear();
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Notes')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: _controller, decoration: InputDecoration(labelText: 'Enter note')),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      _addItem(_controller.text.trim());
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(items[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
