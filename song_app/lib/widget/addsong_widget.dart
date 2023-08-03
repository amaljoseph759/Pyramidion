// ignore_for_file: prefer_typing_uninitialized_variables,

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyramidion/widget/textfield_widget.dart';

import '../controller/songList_controller.dart';

class AddsongWidget extends StatefulWidget {
  AddsongWidget({
    super.key,
  });

  @override
  State<AddsongWidget> createState() => _AddsongWidgetState();
}

class _AddsongWidgetState extends State<AddsongWidget> {
  HomeController songlistcontroller = Get.put(HomeController());

  final abc = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Hero(
                        tag: 'FlButton',
                        child:
                            Icon(Icons.close, size: 30, color: Colors.green)),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFieldWidget(
                    controller: abc,
                    hintText: 'Enter song title',
                    validatorMessage: 'Can\'t leave this field empty',
                    prefixIcon: Icons.wrap_text_sharp,
                  )

                  //     TextFormField(
                  //   decoration: const InputDecoration(
                  //       prefixIcon: Icon(Icons.wrap_text_sharp)),

                  //   controller: abc,
                  //   // songlistcontroller.songnamecontroller,
                  //   //hintText: 'Enter song title',
                  //   validatorMessage: 'Can\'t leave this field empty',
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter your song';
                  //     }

                  //     return null;
                  //   },
                  // ),
                  ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.21),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      songlistcontroller.addSong(abc.text.trim());
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        //padding: EdgeInsets.only(bottom: 25),
                        content: Text("Added new song",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 15)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.black54)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
