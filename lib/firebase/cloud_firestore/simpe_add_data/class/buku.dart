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
        tanggalTerbit: DateTime.parse(json["tanggal_terbit"]),
        jumlahStockBuku: json["jumlah_stock_buku"],
      );

  // Method return Map<String, dynamic> dari informasi buku
  Map<String, dynamic> toJson() => {
        "penulis": penulis,
        "judul_buku": judulBuku,
        "tanggal_terbit": tanggalTerbit.toIso8601String(),
        "jumlah_stock_buku": jumlahStockBuku,
      };
}
