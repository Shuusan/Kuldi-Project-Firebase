import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuldi_firebase/home/components/cloud_firestore_list.dart';
import 'package:kuldi_firebase/home/components/miscellaneous_list.dart';
import 'package:kuldi_firebase/components/title_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // disable debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter-Firebase Library Kuldi-Project',
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
              // Pengganti App Bar Custom untuk Windows
              TitleBar(isHomePage: true),

              // Fitur Cloud Firestore Library
              CloudFirestoreList(),

              // List semua fitur firebase yang ada
              Expanded(child: SizedBox()),

              // Fitur diluar firebase / Episode pengisi
              MiscellaneousList(),
            ],
          ),
        ),
      ),
    );
  }
}
