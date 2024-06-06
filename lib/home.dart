import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuldi_firebase/components/miscellaneous_list.dart';
import 'package:kuldi_firebase/components/title_bar.dart';
import 'package:kuldi_firebase/write_data_to_cloud_firestore_simple/pageAddBuku.dart';

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
              TitleBar(isHomePage: true),
              Expanded(child: PageAddBuku()),
              MiscellaneousList(),
            ],
          ),
        ),
      ),
    );
  }
}
