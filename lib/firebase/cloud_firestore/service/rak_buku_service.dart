import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuldi_firebase/firebase/cloud_firestore/classes/buku.dart';

// Collection name for rak buku
const String collectionName = "rak-buku";

class ServiceRakBuku {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Object referensi untuk collection rak-buku
  late final CollectionReference<Buku> _rakBukuRef;

  //Constructor
  ServiceRakBuku() {
    _rakBukuRef = _firestore.collection(collectionName).withConverter<Buku>(
        // Handle ketika menerima dari firestore
        fromFirestore: (snapshot, _) => Buku.fromJson(snapshot.data()!),
        // Handle sebelum mengirimkan ke firestore
        toFirestore: (rakBuku, _) => rakBuku.toJson());
  }

  // Services - Menambahkan data menggunakan object class buku
  Future<void> addBuku(Buku buku) async {
    await _rakBukuRef.add(buku);
  }

  // Stream collection Rak-Buku
  Stream<QuerySnapshot<Buku>> streamCollectionData() {
    return _rakBukuRef.snapshots();
  }
}
