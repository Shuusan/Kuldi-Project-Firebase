import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OurHelloWorldController extends GetxController {
  OurHelloWorldController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  // Fungsi untuk mengambil semua documents dari sebuah collection
  Future<QuerySnapshot<Map<String, dynamic>>> getRakData() async {
    // Memberikan delay agar bisa terlihat future builder sedang menunggu
    await Future.delayed(const Duration(seconds: 2));
    // Mengambil semua documents dari collection rak buku
    return FirebaseFirestore.instance.collection("rak-buku").get();
  }
}
