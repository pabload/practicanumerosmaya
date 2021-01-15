import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicacubit.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicaestado.dart';
import 'package:practicanumerosmaya/interfaces/paginas/paginapractica/numero_entrada.dart';
import 'package:practicanumerosmaya/interfaces/paginas/paginapractica/numero_esperado.dart';
import 'package:practicanumerosmaya/interfaces/paginas/paginapractica/resultado.dart';
import 'package:practicanumerosmaya/interfaces/paginas/paginapractica/tablero_numeromaya.dart';

class PaginaPractica extends StatelessWidget {
  const PaginaPractica({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginaPracticaCubit, PaginaPracticaEstado>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Practica numeros maya'),
            backgroundColor: Colors.green,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fondomaya.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.verResultado
                          ? Resultado(
                              anchoContenedor:
                                  constraints.maxWidth <= 600 ? 400 : 500,
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Contesta',
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.white),
                                        ),
                                        NumeroEntrada(
                                          anchoContenedor:
                                              constraints.maxWidth <= 600
                                                  ? 200
                                                  : 500,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: constraints.maxWidth * .01,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Resuelve',
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.white),
                                        ),
                                        NumeroEsperado(
                                          anchoContenedor:
                                              constraints.maxWidth <= 600
                                                  ? 150
                                                  : 500,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                if (state.mayaADecimal)
                                  Column(
                                    children: [
                                      Text(
                                        'Simbolos',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                      TableroNumerosMaya(
                                        anchoContenedor:
                                            constraints.maxWidth <= 600
                                                ? 400
                                                : 800,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.0, color: const Color(0xFFFFFFFF)),
                        ),
                        child: FlatButton(
                          child: Text(
                            state.verResultado ? 'Continuar' : 'Comprobar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                            ),
                          ),
                          onPressed: () {
                            if (state.verResultado) {
                              return context
                                  .read<PaginaPracticaCubit>()
                                  .generarNuevoNumero();
                            }
                            context
                                .read<PaginaPracticaCubit>()
                                .comprobarIgualdad();
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
