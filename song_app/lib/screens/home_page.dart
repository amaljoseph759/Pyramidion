import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/songList_controller.dart';
import '../widget/addsong_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Songs List"),
          centerTitle: true,
          backgroundColor: Colors.green[300],
        ),
        body: controller.songs.isEmpty
            ? Center(
                child: Text("Nothing to show"),
              )
            : ListView.builder(
                itemCount: controller.songs.length,
                itemBuilder: (context, index) {
                  final song = controller.songs[index];
                  return ListTile(
                    title: Text(song.title),
                    trailing: IconButton(
                      icon: Icon(
                        song.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        controller.toggleFavourite(song);
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          //padding: EdgeInsets.only(bottom: 25),
                          content: Text(
                              song.isFavourite
                                  ? "Added to wishlist"
                                  : "remove from wishlist",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white)),
                          duration: Duration(seconds: 3),
                        ));
                      },
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddSongBottomSheet(context),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _showAddSongBottomSheet(BuildContext context) {
    final songNameController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddsongWidget();
      },
    );
  }
}
