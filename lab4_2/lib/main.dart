import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ComplexUI());
  }
}

class ComplexUI extends StatefulWidget {
  @override
  _ComplexUIState createState() => _ComplexUIState();
}

class _ComplexUIState extends State<ComplexUI> {
  final TextEditingController _controller = TextEditingController();
  List<String> items = [];

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complex UI Example')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Welcome to My App',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // Input Section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter item',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _addItem, child: Text('Add')),
              ],
            ),
            SizedBox(height: 20),

            // List Section
            Expanded(
              child:
                  items.isEmpty
                      ? Center(child: Text('No items yet'))
                      : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(items[index]),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
