import 'package:flutter/material.dart';
import 'components/card_collection_rak_buku.dart';

import '../../../components/title_bar.dart';

class ReadData extends StatelessWidget {
  const ReadData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom App Bar
          const TitleBar(
            title: "Read Collection Buku",
          ),

          // Main Body : Card Collection Rak Buku
          Expanded(
            child: CardCollectionRakBuku(),
          )
        ],
      ),
    );
  }
}
