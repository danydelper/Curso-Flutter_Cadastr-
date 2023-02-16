import 'package:flutter/material.dart';
import 'package:rotas_pilha/cadastro/controller.dart';
import 'package:rotas_pilha/userMode.dart';

class CdastroView extends StatelessWidget {
  CdastroView({Key? key, required this.user}) : super(key: key);
  final User? user;
  final controller = CadastroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
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
                onPressed: () {
                  controller.addUser(context: context);
                },
                child: Visibility(
                  visible: user == null,
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
