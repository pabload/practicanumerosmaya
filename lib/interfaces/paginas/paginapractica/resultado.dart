import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicacubit.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicaestado.dart';

class Resultado extends StatelessWidget {
  final double anchoContenedor;
  const Resultado({this.anchoContenedor});
  List<Widget> darSimbolo(int numero, Widget simbolo) {
    List<Widget> simbolos = [];
    for (var i = 0; i < numero; i++) {
      simbolos.add(simbolo);
    }
    return simbolos;
  }

  @override
  Widget build(BuildContext context) {
    double anchoNivel = anchoContenedor * .5;
    double altoNivel = 300 * .3;
    return BlocBuilder<PaginaPracticaCubit, PaginaPracticaEstado>(
      builder: (context, state) {
        return Container(
          width: anchoContenedor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  state.correcto
                      ? 'Respuesta correcta'
                      : 'Respuesta incorrecta',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                SizedBox(
                  height: 20,
                ),
                if (state.correcto)
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 100,
                  ),
                if (!state.correcto)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Solución: ',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      if (state.mayaADecimal)
                        Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                        ),
                      if (state.mayaADecimal == false)
                        Text(
                          state.numeroAResolver.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                    ],
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
