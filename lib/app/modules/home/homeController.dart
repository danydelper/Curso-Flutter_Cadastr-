// ignore: file_names
import 'package:rotas_pilha/data/repository/repository.dart';
import 'package:rotas_pilha/data/repository/repository_interface.dart';
import 'package:rotas_pilha/userMode.dart';

// ignore: camel_case_types
class homeController {
  final IUserRepository _userRepository = UserRepository();

  Future<List<User>?> getAllUser() async {
    return await _userRepository.getAll();
  }

  Future<void> deleteUser(String userId) async {
    await _userRepository.deleteUser(
      id: userId,
    );
  }
}
