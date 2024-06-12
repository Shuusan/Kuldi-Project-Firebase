import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/title_bar.dart';
import 'class/buku.dart';
import 'service/rak_buku_service.dart';

class SimpleAddData extends StatelessWidget {
  SimpleAddData({super.key});

  // Text Controller
  final TextEditingController tecPenulis = TextEditingController();
  final TextEditingController tecJudulBuku = TextEditingController();
  final TextEditingController tecJumlahHalaman = TextEditingController();

  // Service rak buku
  final ServiceRakBuku serviceRakBuku = ServiceRakBuku();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Judul Window - Untuk Title Bar dan button back
          // Judul Window
          const TitleBar(
            title: "Add Simple Data - Cloud Firestore",
            isHomePage: false,
          ),
          // Form untuk mengisi data penulis, nama buku, dan jumlah halaman
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //Nama Penulis
                  TextField(
                    controller: tecPenulis,
                    decoration: const InputDecoration(
                      label: Text("Masukan nama penulis"),
                    ),
                  ),

                  //Nama Buku
                  TextField(
                    controller: tecJudulBuku,
                    decoration: const InputDecoration(
                      label: Text("Masukan nama buku"),
                    ),
                  ),

                  //Jumlah halaman → Input Number only
                  TextField(
                    controller: tecJumlahHalaman,
                    // Hanya bisa memasukan angka
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      label: Text("Masukan jumlah halaman"),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Button Add data to Cloud Firestore
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: Get.width * 0.95,
              child: ElevatedButton(
                onPressed: () {
                  //Interlock Input
                  if (tecPenulis.text.isNotEmpty &&
                      tecPenulis.text.isNotEmpty &&
                      tecJumlahHalaman.text.isNotEmpty) {
                    // Membuat object buku berdasarkan data input
                    Buku buku = Buku(
                      penulis: tecPenulis.text,
                      judulBuku: tecJudulBuku.text,
                      tanggalTerbit: DateTime.now(),
                      jumlahStockBuku: int.parse(tecJumlahHalaman.text),
                    );

                    // Memanggil service simple add data
                    serviceRakBuku.addBuku(buku);
                  }

                  // Snackbar top untuk memberitahukan pesan error
                  else {
                    Get.snackbar(
                        "Input Error", "Isi semua data terlebih dahulu",
                        colorText: Colors.white, backgroundColor: Colors.red);
                  }
                },
                child: const Text("Tambah Data"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
