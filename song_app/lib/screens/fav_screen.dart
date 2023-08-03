import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/songList_controller.dart';

class FavouritesScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Songs"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: Obx(() {
        final favouriteSongs =
            controller.songs.where((song) => song.isFavourite).toList();
        if (favouriteSongs.isEmpty) {
          return const Center(
            child: Text('No favourite songs yet.'),
          );
        } else {
          return ListView.builder(
            itemCount: favouriteSongs.length,
            itemBuilder: (context, index) {
              final song = favouriteSongs[index];
              return ListTile(
                title: Text(song.title),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    controller.toggleFavourite(song);
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      //padding: EdgeInsets.only(bottom: 25),
                      content: Text("remove from wishlist",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                      duration: Duration(seconds: 3),
                    ));
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
