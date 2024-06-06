import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuldi_firebase/write_data_to_cloud_firestore_simple/clsBuku.dart';

const String collectionName = "rak-buku";

class SrvcRakBuku {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final CollectionReference _rakBukuRef;

  //Constructor

  SrvcRakBuku() {
    _rakBukuRef = _firestore.collection(collectionName).withConverter<ClsBuku>(
        fromFirestore: (snapshot, _) => ClsBuku.fromJson(snapshot.data()!),
        toFirestore: (rakBuku, _) => rakBuku.toJson());
  }

  // Services

  // Add data
  Future<void> addBuku(ClsBuku buku) async {
    await _rakBukuRef.add(buku);
  }
}
