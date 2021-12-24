import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/resources/Strings.dart';
class ChatProvider {

  static Future<QuerySnapshot<Map<String, dynamic>>> getUsers({required String query}) {
    
    return FirebaseFirestore.instance
      .collection(Strings.usersCollection)
      .limit(50)
      .where(
        Strings.userModelName,
        isEqualTo: query

    )
      .get();
  }
  
}