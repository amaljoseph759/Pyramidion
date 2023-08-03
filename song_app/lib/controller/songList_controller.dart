import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyramidion/model/songs_model.dart';

class HomeController extends GetxController {
  final RxList<Song> songs = <Song>[].obs;
  final _favoritesKey = 'favorites';
  final _songsKey = 'songs';

  @override
  void onInit() {
    super.onInit();
    fetchSongs();
  }

  void addSong(String title) {
    final song = Song(id: DateTime.now().toString(), title: title);
    songs.add(song);
  }

  void fetchSongs() {
    final box = GetStorage();
    final favorites = box.read<List<dynamic>>(_favoritesKey) ?? [];
    final songsData = box.read<List<dynamic>>(_songsKey) ?? [];

    songs.value = songsData.map((data) => Song.fromMap(data)).toList();
    for (final favorite in favorites) {
      final song = songs.firstWhere((s) => s.id == favorite,
          orElse: () => Song(id: favorite, title: 'Unknown Song'));
      if (song != null) {
        song.isFavourite = true;
      }
    }
  }

  void saveSongs() {
    final box = GetStorage();
    final favorites =
        songs.where((song) => song.isFavourite).map((song) => song.id).toList();
    final songsData = songs.map((song) => song.toMap()).toList();
    box.write(_favoritesKey, favorites);
    box.write(_songsKey, songsData);
  }

  void toggleFavourite(Song song) {
    song.isFavourite = !song.isFavourite;
    saveSongs();
    fetchSongs();
    update(); // Manually notify the UI about the changes
  }
}
