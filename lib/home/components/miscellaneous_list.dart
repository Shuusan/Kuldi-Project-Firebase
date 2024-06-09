import 'package:flutter/material.dart';
import 'package:kuldi_firebase/miscellaneous/our_hello_world/our_hello_world.dart';

class MiscellaneousList extends StatelessWidget {
  const MiscellaneousList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1),
        const Text("Miscellaneous"),
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
                              return const OurHelloWorld();
                            },
                            barrierDismissible: true);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: const Text(
                        "Our Hello World",
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
