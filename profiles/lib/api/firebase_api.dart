import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profiles/model/user.dart';

import '../utils.dart';

class FirebaseApi {
  static Stream<List<User>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(User.fromJson));
}