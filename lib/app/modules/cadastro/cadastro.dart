import 'package:flutter/material.dart';
import 'package:rotas_pilha/app/modules/cadastro/controller.dart';
import 'package:rotas_pilha/userMode.dart';

class CdastroView extends StatelessWidget {
  CdastroView({Key? key, required this.userId}) : super(key: key);
  final String? userId;
  final controller = CadastroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        actions: [
          FutureBuilder<User>(
            future: controller.getUser(userId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data!;
                if (user.id != null) {
                  return const Icon(Icons.edit);
                }
                return const Icon(Icons.person);
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else {
                return const Text("Carregando...");
              }
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.idadeController,
                      decoration: const InputDecoration(
                        label: Text('Idade'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () async {
                  if (userId == null) {
                    await controller.addUser(context: context);
                  }

                  if (userId != null) {
                    await controller.editUser(
                        context: context, userId: userId!);
                  }
                },
                child: Visibility(
                  visible: userId == null,
                  child: const Text('Cadastrar'),
                  replacement: const Text('Editar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
