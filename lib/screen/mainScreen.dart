import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/components/itemslist.dart';
import 'package:provider_practice/model/note.dart';
import 'package:provider_practice/providers/itemStore.dart';
import 'package:provider_practice/widgets/itemtile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<Itemstore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                TextFormField(
                    controller: titleController,
                    decoration:
                        const InputDecoration(hintText: 'Enter your title')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Note note = Note(DateTime.now().toString(),
                          titleController.text.toString());

                      if (titleController.text.isNotEmpty) {
                        itemsProvider.addItem(note);
                        titleController.text = '';
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Title cannot be empty')));
                      }
                    },
                    child: const Text(
                      'add',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          const ItemsList()
        ],
      ),
    );
  }
}
