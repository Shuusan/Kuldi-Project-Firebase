import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class TitleBar extends GetView<HomeController> {
  const TitleBar(
      {super.key,
      this.title = "Flutter-Firebase Library Kuldi-Project",
      this.isHomePage = false});

  final String title;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return WindowTitleBarBox(
      child: Container(
        color: Colors.deepPurple.shade200,
        child: Row(
          children: [
            if (!isHomePage)
              IconButton(
                  iconSize: 18,
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_sharp)),
            // Daerah Drag Window
            Expanded(
              child: MoveWindow(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            // Tombol toggle always on top
            WindowButton(
              iconBuilder: (ctx) {
                // Ganti Icon sesuai dengan value alwaysOnTop
                if (controller.isAlwaysOnTop) {
                  return const Center(
                    child: Icon(
                      Icons.tv,
                      size: 15,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return const Icon(Icons.tv_off,
                      size: 15, color: Colors.white);
                }
              },

              //toggle jika button dipencet
              onPressed: () {
                controller.toggleAlwaysOnTop();
              },
            ),

            // Tombol minimized
            MinimizeWindowButton(colors: _minimizedButtonColors),

            // Tombol close program
            CloseWindowButton(colors: _closeButtonColors),
          ],
        ),
      ),
    );
  }
}

// Bits dojo window setting
final _closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color.fromARGB(255, 255, 255, 255),
    iconMouseOver: Colors.white);

final _minimizedButtonColors = WindowButtonColors(
    iconNormal: const Color.fromARGB(255, 255, 255, 255),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color.fromARGB(255, 213, 71, 231),
    iconMouseDown: const Color.fromARGB(255, 141, 15, 130));
