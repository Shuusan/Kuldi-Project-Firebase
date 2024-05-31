import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kuldi_firebase/firebase_options.dart';
import 'package:kuldi_firebase/components/miscellaneous_list.dart';

Future<void> main() async {
  // Pastikan kalau semua binding sudah selesai sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Inisiasi Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Menjalankan Aplikasi
  runApp(const KuldiFirebaseLibrary());
}

class KuldiFirebaseLibrary extends StatelessWidget {
  const KuldiFirebaseLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Kuldi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Column(
            children: [
              Expanded(child: SizedBox()),
              MiscellaneousList(),
            ],
          ),
        ),
      ),
    );
  }
}
