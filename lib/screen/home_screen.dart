import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition/const/color.dart';
import 'package:text_recognition/const/style.dart';
import 'package:text_recognition/const/text.dart';
import 'package:text_recognition/controller/home_controller.dart';
import 'package:text_recognition/widget/button_widget.dart';
import 'package:text_recognition/widget/container_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: blackColor,
          title: const Text(
            appbarText,
            style: appbarStyle,
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // homeController.textScanning.value == '' &&
                //         homeController.imageFile == null
                //     ? ContainerWidget(
                //         width: 300,
                //         height: 300,
                //         child: const SizedBox(),
                //       )
                //     : Image.file(File(homeController.imageFile!.path)),
                if (homeController.textScanning.value == '' &&
                    homeController.imageFile == null)
                  ContainerWidget(
                    width: 300,
                    height: 300,
                    child: const SizedBox(),
                  ),
                if (homeController.imageFile != null)
                  Image.file(File(homeController.imageFile!.path)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      onPressed: () async {
                        await homeController.getImage(ImageSource.gallery);
                      },
                      width: 70,
                      height: 50,
                      color: whiteColor,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.image,
                            color: Colors.black,
                          ),
                          Text(
                            'Gallery',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonWidget(
                      onPressed: () async {
                        await homeController.getImage(ImageSource.camera);
                      },
                      width: 70,
                      height: 50,
                      color: whiteColor,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            'Camera',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
