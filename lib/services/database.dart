import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/comidas/lunes.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference usuarios
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
        name: document.get('name') ,
        peso: document.get('peso') ,
        Altura: document.get('Altura') ,
        edad: document.get('edad') ,
        cita: document.get('cita') ,
        celular: document.get('celular') ,

      );
    }).toList();
  
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot['name'],
      peso: snapshot['peso'],
      Altura: snapshot['Altura'] ,
      edad: snapshot['edad'],
      cita: snapshot['cita'],
      celular: snapshot['celular'],
    );
  }
    
  

  //get clientes stream
  Stream<List<Usuario?>> get clientes {
    return clientesCollection.snapshots()
    .map(_clientesListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData>get userData{
    return clientesCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  //*********************************************************** */
  
  //collection reference usuarios
  final CollectionReference dietasCollection =
      FirebaseFirestore.instance.collection('dietas');



  

  




  




  

}
