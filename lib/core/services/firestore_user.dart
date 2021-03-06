import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/user_model.dart';

class FirestoreUser {
  final CollectionReference _userCollectin =
      FirebaseFirestore.instance.collection('Users');
  Future <void> addUserToFireStore(UserModel userModel) async{
    return await _userCollectin.doc(userModel.userId).set(userModel.toJson());
  }
  Future<List<QueryDocumentSnapshot>>getUserData()async{
    var value=await _userCollectin.get();
    return value.docs;
  }

}
