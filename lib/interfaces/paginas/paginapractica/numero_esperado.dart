import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicacubit.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicaestado.dart';

class NumeroEsperado extends StatelessWidget {
  double anchoContenedor;
  NumeroEsperado({this.anchoContenedor});
  List<Widget> darSimbolo(int numero, Widget simbolo) {
    List<Widget> simbolos = [];
    for (var i = 0; i < numero; i++) {
      simbolos.add(simbolo);
    }
    return simbolos;
  }

  @override
  Widget build(BuildContext context) {
    double anchoNivel = MediaQuery.of(context).size.width;
    double altoNivel = 300 * .3;
    return BlocConsumer<PaginaPracticaCubit, PaginaPracticaEstado>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        print(state.numeroAResolver);
        print(
            'nivel1 : barras:${state.nivel1.barras},circulos:${state.nivel1.circulos},cacao:${state.nivel1.cacao}');
        print(
            'nivel2 : barras:${state.nivel2.barras},circulos:${state.nivel2.circulos},cacao:${state.nivel2.cacao}');
        print(
            'nivel3 : barras:${state.nivel3.barras},circulos:${state.nivel3.circulos},cacao:${state.nivel3.cacao}');
        return Container(
          width: anchoContenedor,
          height: 300,
          /*decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
          ),*/
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: state.mayaADecimal == false
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: anchoNivel,
                          height: altoNivel,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
                          ),
                          child: state.numeroAResolver == 400
                              ? Center(
                                  child: Icon(
                                    Icons.panorama_fish_eye,
                                    color: Colors.white,
                                  ),
                                )
                              : Center(child: Text('')),
                        ),
                        Container(
                          width: anchoNivel,
                          height: altoNivel,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.nivel2.circulos > 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: darSimbolo(
                                      state.nivel2.circulos,
                                      Icon(
                                        Icons.panorama_fish_eye,
                                        color: Colors.white,
                                      )),
                                ),
                              if (state.nivel2.barras > 0)
                                Column(
                                  children: darSimbolo(
                                      state.nivel2.barras,
                                      Divider(
                                        color: Colors.white,
                                        thickness: 6,
                                      )),
                                ),
                              if (state.nivel2.cacao > 0)
                                Icon(
                                  Icons.panorama_photosphere_select,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        ),
                        Container(
                          width: anchoNivel,
                          height: altoNivel,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFFFFF)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.nivel1.circulos > 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: darSimbolo(
                                    state.nivel1.circulos,
                                    Icon(
                                      Icons.panorama_fish_eye,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              if (state.nivel1.barras > 0)
                                Column(
                                  children: darSimbolo(
                                      state.nivel1.barras,
                                      Divider(
                                        color: Colors.white,
                                        thickness: 6,
                                      )),
                                ),
                              if (state.nivel1.cacao > 0)
                                Icon(
                                  Icons.panorama_photosphere_select,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Text(
                      state.numeroAResolver.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
            ),
          ),
        );
      },
    );
  }
}
