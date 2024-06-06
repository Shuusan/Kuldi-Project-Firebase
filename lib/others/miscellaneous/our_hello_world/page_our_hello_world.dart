import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuldi_firebase/components/title_bar.dart';

class PageOurHelloWorld extends StatefulWidget {
  const PageOurHelloWorld({super.key});

  @override
  State<PageOurHelloWorld> createState() => _PageOurHelloWorldState();
}

class _PageOurHelloWorldState extends State<PageOurHelloWorld> {
  // Fungsi untuk mengambil semua documents dari sebuah collection
  Future<QuerySnapshot<Map<String, dynamic>>> getRakData() async {
    // Memberikan delay agar bisa terlihat future builder sedang menunggu
    await Future.delayed(const Duration(seconds: 2));
    // Mengambil semua documents dari collection rak buku
    return FirebaseFirestore.instance.collection("rak-buku").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TitleBar(
              title: "Our Hello World - First Code KuldiProject Firebase"),
          Expanded(
            child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: getRakData(),
                builder: (context, snapshot) {
                  // Checking apakah fungsi getRakData sudah selesai
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Checking apakah hasil dari getRakData memiliki data
                    if (snapshot.hasData) {
                      // Tampilkan field "penulis"
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (var doc in snapshot.data!.docs)
                              Text(
                                doc["penulis"] + " : " + doc["judul_buku"],
                                style: const TextStyle(fontSize: 16),
                              )
                          ],
                        ),
                      );
                    } else {
                      // Ketika hasil future data rusak / gagal
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
                  } else {
                    // Ketika sedang menunggu mengambil data
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text(
                              'Mengambil data dari Cloud Firestore',
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
          ),
        ],
      ),

      // Setstate untuk rebuild widget, dimana akan mentrigger fungsi getRakData()
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        tooltip: 'Refresh List',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
