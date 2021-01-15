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
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '!Practica los numeros en maya!',
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 15,
                ),
                FlatButton(
                  child: Text('Comenzar'),
                  onPressed: () {
                    context.read<PaginaPracticaCubit>().generarNuevoNumero();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaginaPractica()),
                    );
                  },
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
