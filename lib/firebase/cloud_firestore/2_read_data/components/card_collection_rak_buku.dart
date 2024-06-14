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
        // Check apakah ada data atau tidak
        if (snapshot.hasData) {
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
