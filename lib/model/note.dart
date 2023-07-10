class Note {
  final String title;
  final String id;
  Note(this.id, this.title);
  @override
  bool operator ==(other) {
    return other is Note && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
