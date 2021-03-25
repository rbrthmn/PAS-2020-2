import 'package:flutter/cupertino.dart';
import 'package:mcv/models/user-model.dart';
import 'package:mcv/repository/user_repository.dart';

class UserController {
  final formKey = GlobalKey<FormState>();
  final UserRepository repository;
  UserModel user = UserModel();

  UserController(this.repository);

  setUserEmail(String value) => user.email = value;

  setUserName(String value) => user.name = value;

  setUserTelephone(String value) => user.telephone = value;

  setUserType(String value) => user.type = value;

  Future<bool> save() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    formKey.currentState.save();

    try {
      return await repository.saveUser(user);
    } catch (e) {
      return false;
    }
  }
}
