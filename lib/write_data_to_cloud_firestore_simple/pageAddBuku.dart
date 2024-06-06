import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuldi_firebase/write_data_to_cloud_firestore_simple/clsBuku.dart';
import 'package:kuldi_firebase/write_data_to_cloud_firestore_simple/srvcRakBuku.dart';

class PageAddBuku extends StatefulWidget {
  const PageAddBuku({super.key});

  @override
  State<PageAddBuku> createState() => _PageAddBukuState();
}

class _PageAddBukuState extends State<PageAddBuku> {
  //Text Controller
  final TextEditingController tecPenulis = TextEditingController();
  final TextEditingController tecJudulBuku = TextEditingController();
  final TextEditingController tecJumlahHalaman = TextEditingController();

  //Service
  SrvcRakBuku srvcRakBuku = SrvcRakBuku();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //Nama Penulis
                TextField(
                  controller: tecPenulis,
                  decoration: const InputDecoration(
                      label: Text("Masukan nama penulis")),
                ),
                //Nama Buku
                TextField(
                  controller: tecJudulBuku,
                  decoration:
                      const InputDecoration(label: Text("Masukan nama buku")),
                ),
                //Jumlah halaman → Input Number only
                TextField(
                  controller: tecJumlahHalaman,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                      label: Text("Masukan jumlah halaman")),
                ),
              ],
            ),
          ),

          //Button Submit
          ElevatedButton(
              onPressed: () {
                ClsBuku buku = ClsBuku(
                    penulis: tecPenulis.text,
                    judulBuku: tecJudulBuku.text,
                    tanggalTerbit: DateTime.now(),
                    jumlahStockBuku: int.parse(tecJumlahHalaman.text));

                srvcRakBuku.addBuku(buku);
              },
              child: const Text("Tambah Data"))
        ],
      ),
    );
  }
}
