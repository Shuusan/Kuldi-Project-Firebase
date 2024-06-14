import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../classes/buku.dart';

class CardBuku extends StatelessWidget {
  const CardBuku({
    super.key,
    required this.data,
    required this.index,
  });

  final List<QueryDocumentSnapshot<Buku>> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Judul buku dan Penulis
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(data[index].data().judulBuku),
                  Text(data[index].data().penulis),
                ],
              ),
            ),

            // Stock buku dan tanggal terbit
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Stock Buku : ${data[index].data().jumlahStockBuku}"),
                Text(DateFormat.yMMMMEEEEd()
                    .format(data[index].data().tanggalTerbit)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
