class Song {
  final String id;
  final String title;
  bool isFavourite;

  Song({required this.id, required this.title, this.isFavourite = false});

  factory Song.fromMap(Map<String, dynamic> data) {
    return Song(
      id: data['id'],
      title: data['title'],
      isFavourite: data['isFavourite'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isFavourite': isFavourite,
    };
  }
}
