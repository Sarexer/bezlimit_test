import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({
    Key? key,
    required this.index,
    required this.maxIndex,
  }) : super(key: key) {
    textController = TextEditingController(text: index.toString());
  }

  final int index;
  final int maxIndex;
  late final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                keyboardType: TextInputType.number,
                autofocus: true,
              ),
              ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  _saveIndex(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _saveIndex(BuildContext context) {
    var selectedIndex = int.parse(textController.text);

    if (selectedIndex > maxIndex) {
      Get.snackbar('Ошибка', "Максимальный индекс равен $maxIndex");
    } else {
      Navigator.pop(context, int.parse(textController.text));
    }
  }
}
