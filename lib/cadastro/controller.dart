import 'package:flutter/material.dart';
import 'package:rotas_pilha/data/api.dart';
import 'package:rotas_pilha/userMode.dart';

class CadastroController {
  final ApiService _apiService = ApiService();
  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<List<User>> addUser({required BuildContext context}) async {
    final response = await _apiService.dio.post(
      "/user",
      data: {"name": nameController.text, "idade": idadeController.text},
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    }
    print(response.data);
    return [];
  }
}
