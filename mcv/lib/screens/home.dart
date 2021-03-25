import 'package:flutter/material.dart';
import 'package:mcv/screens/employee-form-screen.dart';
import 'package:mcv/screens/pf_form_screen.dart';
import 'package:mcv/screens/pj-form_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abertura de contas"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => PfForm()));
                },
                child: Text("Cadastrar conta PF")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => PjForm()));
                },
                child: Text("Cadastrar conta PJ")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => EmployeeForm()));
                },
                child: Text("Cadastrar funcionário"))
          ],
        ),
      ),
    );
  }
}
