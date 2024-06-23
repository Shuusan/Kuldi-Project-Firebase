import 'package:cloud_firestore/cloud_firestore.dart';

class Buku {
  // Properties
  String penulis;
  String judulBuku;
  DateTime tanggalTerbit;
  int jumlahStockBuku;

  // Constructor
  Buku({
    required this.penulis,
    required this.judulBuku,
    required this.tanggalTerbit,
    required this.jumlahStockBuku,
  });

  // Constructor dengan json parameter
  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        penulis: json["penulis"],
        judulBuku: json["judul_buku"],
        tanggalTerbit: json["tanggal_terbit"].toDate(),
        jumlahStockBuku: json["jumlah_stock_buku"],
      );

  // Method return Map<String, dynamic> dari informasi buku
  Map<String, dynamic> toJson() => {
        "penulis": penulis,
        "judul_buku": judulBuku,
        "tanggal_terbit": Timestamp.fromDate(tanggalTerbit),
        "jumlah_stock_buku": jumlahStockBuku,
      };
}
