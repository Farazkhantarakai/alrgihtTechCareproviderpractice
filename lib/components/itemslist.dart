import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/model/note.dart';

import '../providers/itemStore.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<Itemstore>(context, listen: true);
    return Expanded(
      child: ListView.builder(
          itemCount: itemsProvider.getNotes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text('$index'),
                title: Text(itemsProvider.getNotes[index].title),
                trailing: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Note note = Note(itemsProvider.getNotes[index].id,
                          itemsProvider.getNotes[index].title);
                      itemsProvider.removeItem(note);
                    },
                    child: const Text(
                      'delete',
                    )),
              ),
            );
          }),
    );
  }
}
