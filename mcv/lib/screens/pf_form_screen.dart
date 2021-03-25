import 'package:flutter/material.dart';
import 'package:mcv/controllers/user_controller.dart';
import 'package:mcv/repository/user_repository.dart';

class PfForm extends StatefulWidget {
  @override
  _PfFormState createState() => _PfFormState();
}

class _PfFormState extends State<PfForm> {
  UserController userController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    userController = UserController(UserRepository());
    userController.setUserType("PF");
  }

  @override
  void dispose() {
    super.dispose();
  }

  _saveSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Usuário salvado com sucesso'),
      backgroundColor: Colors.green,
    ));
  }

  _saveError() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Erro ao salvar'),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Conta PF"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Form(
          key: userController.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nome"),
                  onSaved: userController.setUserName,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo não pode ser vazio';
                    } else if (value.length < 3) {
                      return 'Nome inválido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Telefone"),
                  onSaved: userController.setUserTelephone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo não pode ser vazio';
                    } else if (value.length != 8) {
                      return 'Telefone inválido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "E-mail"),
                  onSaved: userController.setUserEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo não pode ser vazio';
                    } else if (!value.contains('@')) {
                      return 'Email não é válido';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (await userController.save()) {
                        _saveSuccess();
                      } else {
                        _saveError();
                      }
                    },
                    child: Text("Salvar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
