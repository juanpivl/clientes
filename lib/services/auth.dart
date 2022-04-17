import 'package:firebase_auth/firebase_auth.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/services/services.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  Clientes? _userFromFirebaseUser (User user){
    return user != null ? Clientes(uid: user.uid) : null;
  }

  //auth change user stream
 Stream<Clientes?> get user  {  
    return  _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
   }
  

  //sign in anonimus
  Future signInAnon() async{
    try{
     UserCredential result = await _auth.signInAnonymously();
     User? user = result.user;
     return _userFromFirebaseUser(user!);

    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with email
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email
  Future registerWithEmail(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData('nombre', 'peso', 'altura', 'edad', '01/05/22', '6621...');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}