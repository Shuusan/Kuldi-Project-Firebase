import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuldi_firebase/controllers/title_bar_controller.dart';
import 'package:kuldi_firebase/firebase_options.dart';
import 'package:kuldi_firebase/home/home.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  // Pastikan kalau semua binding sudah selesai sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Pastikan kalau pengaturan untuk setting window sudah selesai
  await windowManager.ensureInitialized();

  // Setting Window
  windowManager.waitUntilReadyToShow(_windowsOptionSetting(), () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setAlwaysOnTop(true);

    //await windowManager.setResizable(false);
  });

  // Inisiasi Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inisiasi GetX Controller Injections
  Get.lazyPut(() => TitleBarController());

  // Menjalankan Aplikasi
  runApp(const HomePage());
}

// Return settingOption untuk konfigurasi yang diinginkan
WindowOptions _windowsOptionSetting() {
  return const WindowOptions(
    size: Size(600, 600),
    center: true,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: true,
  );
}
