import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tfg_maria_app/core/domain/entities/login.entity.dart';
import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firestore/factory/login.factory.dart';
import 'package:tfg_maria_app/core/domain/ports/repositories/login.repository.dart';

class FirestoreLoginRepository implements BaseLoginRepository {
  final CollectionReference<Map<String, dynamic>> loginsCollection;

  FirestoreLoginRepository({required this.loginsCollection});

  @override
  Future<List<LoginEntity>> get() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await loginsCollection.get();

    return querySnapshot.docs.map((snapshot) => LoginFactory.entityFromSource(snapshot.id, snapshot.data())).toList();
  }
}
