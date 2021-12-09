import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key, required this.index}) : super(key: key) {
    textController = TextEditingController(text: index.toString());
  }

  final int index;
  late final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.pop(context, int.parse(textController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
