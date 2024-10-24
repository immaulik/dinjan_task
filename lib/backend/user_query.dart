import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinjan_task/models/user_model.dart';

class UserQuery {
  final userCol = FirebaseFirestore.instance.collection('users');

  Future<void> addUser({required UserModel user}) async {
    DocumentReference docRef = await userCol.add(user.toJson());
    String documentId = docRef.id;
    await docRef.update({
      "id": documentId, // Storing the unique ID within the document
    });
  }

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> modelList = [];

    try {
      QuerySnapshot querySnapshot = await userCol.get();
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        UserModel model = UserModel.fromJson(data);
        modelList.add(model);
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    return modelList;
  }

  Future<List<UserModel>> getSingleUserByUserId(String userId) async {
    try {
      // Query Firestore for documents where the 'field' matches the provided value
      QuerySnapshot querySnapshot = await userCol
          .where('userId', isEqualTo: userId) // Field and the value to search
          .get();

      // Check if any documents were found
      if (querySnapshot.docs.isNotEmpty) {
        // Map each document into a list of model instances
        return querySnapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList();
      } else {
        print('No documents found matching the field value.');
        return [];
      }
    } catch (e) {
      print('Error searching documents: $e');
      return [];
    }
  }




  Future<List<UserModel>> getSingleUserByEmail(String email) async {
    try {
      // Query Firestore for documents where the 'field' matches the provided value
      QuerySnapshot querySnapshot = await userCol
          .where('email', isEqualTo: email) // Field and the value to search
          .get();

      // Check if any documents were found
      if (querySnapshot.docs.isNotEmpty) {
        // Map each document into a list of model instances
        return querySnapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList();
      } else {
        print('No documents found matching the field value.');
        return [];
      }
    } catch (e) {
      print('Error searching documents: $e');
      return [];
    }
  }

  Future<void> editUser(UserModel model) async {
    await userCol.doc(model.id).set(model.toJson());
  }
}
