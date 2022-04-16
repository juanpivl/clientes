import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference clientesCollection =
      FirebaseFirestore.instance.collection('clientes');

  Future updateUserData(String name, String peso, String Altura, String edad,
      String cita, String celular) async {
    return await clientesCollection.doc(uid).set({
      'name': name,
      'peso': peso,
      'Altura': Altura,
      'edad': edad,
      'cita': cita,
      'celular': celular,
    });
  }

//get list from snapshot
  List<Usuario?> _clientesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      return Usuario(
        name: document.get('name') ?? '',
        peso: document.get('peso') ?? '',
        Altura: document.get('Altura') ?? '',
        edad: document.get('edad') ?? '',
        cita: document.get('cita') ?? '',
        celular: document.get('celular') ?? '',

      );
    }).toList();
  
  }
    
  

  //get clientes stream
  Stream<List<Usuario?>> get clientes {
    return clientesCollection.snapshots()
    .map(_clientesListFromSnapshot);
  }

  //

}
