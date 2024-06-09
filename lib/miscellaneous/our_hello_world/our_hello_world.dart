import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuldi_firebase/components/title_bar.dart';
import 'package:kuldi_firebase/miscellaneous/our_hello_world/our_hello_world_controller.dart';

class OurHelloWorld extends GetView<OurHelloWorldController> {
  const OurHelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    // Injeksi Get Controller
    Get.put(OurHelloWorldController());

    return Scaffold(
      body: Column(
        children: [
          // Bar pengganti AppBar
          const TitleBar(
              title: "Our Hello World - First Code KuldiProject Firebase"),

          // Body
          Expanded(
            child: GetBuilder<OurHelloWorldController>(
              builder: (_) =>
                  FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: controller.getRakData(),
                      builder: (context, snapshot) {
                        // Checking apakah fungsi getRakData sudah selesai
                        if (snapshot.connectionState == ConnectionState.done) {
                          // Checking apakah hasil dari getRakData memiliki data
                          if (snapshot.hasData) {
                            // Tampilkan field "penulis"
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Text>[
                                  for (var doc in snapshot.data!.docs)
                                    // Menampilkan nama buku dan nama penulis
                                    Text(
                                      doc["penulis"] +
                                          " : " +
                                          doc["judul_buku"],
                                      style: const TextStyle(fontSize: 16),
                                    )
                                ],
                              ),
                            );
                          }
                          // Ketika hasil future data rusak / gagal
                          else {
                            return const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Data Error . . .',
                                  ),
                                ],
                              ),
                            );
                          }
                        }

                        // Ketika sedang menunggu mengambil data
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Loading Circular
                              CircularProgressIndicator(),
                              // Text Menunggu
                              Padding(
                                padding: EdgeInsets.all(30.0),
                                child: Text(
                                  'Mengambil data dari Cloud Firestore',
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          ),
        ],
      ),

      // Setstate untuk rebuild widget, dimana akan mentrigger fungsi getRakData()
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.update();
        },
        tooltip: 'Refresh List',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
