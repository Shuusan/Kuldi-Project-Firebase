import 'package:flutter/material.dart';
import '../../firebase/cloud_firebase_export.dart';

class CloudFirestoreList extends StatelessWidget {
  const CloudFirestoreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 0.25),
          child: Divider(height: 1),
        ),
        const Text("Cloud Firestore Library"),
        const Divider(height: 1),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(

              // Jumlah Item yang akan ditampilkan
              itemCount: 1,

              // Buat biar discrollnya horizontal
              scrollDirection: Axis.horizontal,

              // Padding untuk listview
              padding: const EdgeInsets.all(8),

              // Fungsi Build
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleAddData();
                            },
                            barrierDismissible: true);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: const Text(
                        "Simple Add Data",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
