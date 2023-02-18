import 'package:flutter/material.dart';
import 'package:rotas_pilha/data/repository/repository.dart';
import 'package:rotas_pilha/data/repository/repository_interface.dart';

import '../../../userMode.dart';

class CadastroController {
  final IUserRepository _userRepository = UserRepository();
  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<void> addUser({required BuildContext context}) async {
    final response = await _userRepository.postUser(
      data: {"name": nameController.text, "idade": idadeController.text},
    );
    if (response) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    }
  }

  Future<void> editUser(
      {required BuildContext context, required String userId}) async {
    final response = await _userRepository.putUser(
      data: {"name": nameController.text, "idade": idadeController.text},
      id: userId,
    );

    if (response) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    }
  }

  Future<User> getUser(String? userId) async {
    if (userId != null) {
      final user = await _userRepository.getFindUser(
        id: userId,
      );

      nameController.text = user.nome;
      idadeController.text = user.idade.toString();

      return user;
    } else {
      return User(nome: '', idade: 0);
    }
  }
}
