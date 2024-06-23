import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'card_buku.dart';

import '../../classes/buku.dart';
import '../../service/rak_buku_service.dart';

class CardCollectionRakBuku extends StatelessWidget {
  CardCollectionRakBuku({
    super.key,
  });

  final ServiceRakBuku serviceRakBuku = ServiceRakBuku();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Buku>>(
      stream: serviceRakBuku.streamCollectionData(),
      builder: (context, snapshot) {
        // Data Error : Tampilkan Pesan Error
        if (snapshot.hasError) {
          return Center(child: Text("Error : ${snapshot.error}"));
        }

        // Sedang mengambil data : Circular Progress
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Data diterima : List Card Buku

        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          var data = snapshot.data!.docs;

          // Create list builder
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardBuku(
                  data: data,
                  index: index,
                ),
              );
            },
          );
        }

        // Kalau belum ada data, tampilkan pesan
        return const Center(
          child: Text("Tidak ada data"),
        );
      },
    );
  }
}
