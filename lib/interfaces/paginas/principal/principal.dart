import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicacubit.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicaestado.dart';
import 'package:practicanumerosmaya/interfaces/paginas/paginapractica/pagina_practica.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginaPracticaCubit, PaginaPracticaEstado>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fondomaya.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/fondolibreta.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '!Practica los números en maya!',
                        textAlign: TextAlign.center,
                        style: TextStyle( fontSize: 50),
                      ),
                      Image.asset(
                        'assets/mascara.png',
                        width: 200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton(
                        child: Text(
                          'Comenzar',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 50),
                        ),
                        onPressed: () {
                          context
                              .read<PaginaPracticaCubit>()
                              .generarNuevoNumero();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaginaPractica()),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
