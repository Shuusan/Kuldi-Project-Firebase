// To parse this JSON data, do
// final clsRakBuku = clsRakBukuFromJson(jsonString);

import 'dart:convert';

ClsBuku clsBukuFromJson(String str) => ClsBuku.fromJson(json.decode(str));

String clsBukuToJson(ClsBuku data) => json.encode(data.toJson());

class ClsBuku {
  String penulis;
  String judulBuku;
  DateTime tanggalTerbit;
  int jumlahStockBuku;

  ClsBuku({
    required this.penulis,
    required this.judulBuku,
    required this.tanggalTerbit,
    required this.jumlahStockBuku,
  });

  factory ClsBuku.fromJson(Map<String, dynamic> json) => ClsBuku(
        penulis: json["penulis"],
        judulBuku: json["judul_buku"],
        tanggalTerbit: DateTime.parse(json["tanggal_terbit"]),
        jumlahStockBuku: json["jumlah_stock_buku"],
      );

  Map<String, dynamic> toJson() => {
        "penulis": penulis,
        "judul_buku": judulBuku,
        "tanggal_terbit": tanggalTerbit.toIso8601String(),
        "jumlah_stock_buku": jumlahStockBuku,
      };
}
