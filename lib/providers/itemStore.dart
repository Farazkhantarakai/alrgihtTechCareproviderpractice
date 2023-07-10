import 'package:flutter/material.dart';
import '../model/note.dart';

class Itemstore extends ChangeNotifier {
  final List<Note> _items = [];

  List<Note> get getNotes => _items;

  void addItem(Note note) {
    _items.add(note);
    notifyListeners();
  }

  void removeItem(Note note) {
    _items.remove(note);
    notifyListeners();
  }
}
