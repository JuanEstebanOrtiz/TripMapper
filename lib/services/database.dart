import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference negocioCollection = Firestore.instance.collection('negocios');
  
  Future updateUserData(String informacion, String servicio, int tarifa, String ubicacion) async {
    return await negocioCollection.document(uid).setData({
      'informacion' : informacion,
      'servicio' : servicio,
      'tarifa' : tarifa,
      'ubicacion' : ubicacion,
    });   
  }

}