import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicacubit.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicaestado.dart';
import 'package:practicanumerosmaya/dominio/nivel.dart';

class NumeroEntrada extends StatelessWidget {
  double anchoContenedor;
  NumeroEntrada({this.anchoContenedor});
  List<Widget> darSimbolo(int numero, Widget simbolo) {
    List<Widget> simbolos = [];
    for (var i = 0; i < numero; i++) {
      simbolos.add(simbolo);
    }
    return simbolos;
  }

  Widget darNumeroEnNivel(Nivel nivel) {
    return Column(
      children: [
        if (nivel.circulos > 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: darSimbolo(nivel.circulos, Icon(
              Icons.panorama_fish_eye,
              color: Colors.white,
            )),
          ),
        if (nivel.barras > 0)
          Column(
            children: darSimbolo(
                nivel.barras,
                Divider(
                  color: Colors.white,
                  thickness: 6,
                )),
          ),
        if (nivel.cacao > 0)
          Icon(
            Icons.panorama_photosphere_select,
            color: Colors.white,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double anchoNivel = MediaQuery.of(context).size.width;
    return BlocBuilder<PaginaPracticaCubit, PaginaPracticaEstado>(
      builder: (context, state) {
        return Container(
          width: anchoContenedor,
          height: 300,
          child: !state.mayaADecimal
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Ingresa el numero en decimal',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged: (numero) {
                        context
                            .read<PaginaPracticaCubit>()
                            .asignarNumeroDecimal(numero);
                      },
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: anchoContenedor,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
                            color: state.nivelseleccionado == 3
                                ? Colors.white54
                                : Colors.white10,
                          ),
                          child: FlatButton(
                            child: darNumeroEnNivel(state.entradanivel3),
                            onPressed: () {
                              context
                                  .read<PaginaPracticaCubit>()
                                  .seleccionarNivel(3);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: anchoContenedor,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
                            color: state.nivelseleccionado == 2
                                ? Colors.white54
                                : Colors.white10,
                          ),
                          child: FlatButton(
                            child: darNumeroEnNivel(state.entradanivel2),
                            onPressed: () {
                              context
                                  .read<PaginaPracticaCubit>()
                                  .seleccionarNivel(2);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: anchoContenedor,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
                            color: state.nivelseleccionado == 1
                                ? Colors.white54
                                : Colors.white10,
                          ),
                          child: FlatButton(
                            child: darNumeroEnNivel(state.entradanivel1),
                            onPressed: () {
                              context
                                  .read<PaginaPracticaCubit>()
                                  .seleccionarNivel(1);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
