// To parse this JSON data, do
// final clsRakBuku = clsRakBukuFromJson(jsonString);

import 'dart:convert';

ClsRakBuku clsRakBukuFromJson(String str) =>
    ClsRakBuku.fromJson(json.decode(str));

String clsRakBukuToJson(ClsRakBuku data) => json.encode(data.toJson());

class ClsRakBuku {
  String penulis;
  String judulBuku;
  DateTime tanggalTerbit;
  int jumlahStockBuku;

  ClsRakBuku({
    required this.penulis,
    required this.judulBuku,
    required this.tanggalTerbit,
    required this.jumlahStockBuku,
  });

  factory ClsRakBuku.fromJson(Map<String, dynamic> json) => ClsRakBuku(
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
