import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicacubit.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicaestado.dart';

class TableroNumerosMaya extends StatelessWidget {
  double anchoContenedor;
  TableroNumerosMaya({this.anchoContenedor});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginaPracticaCubit, PaginaPracticaEstado>(
      builder: (context, state) {
        return Container(
          width: anchoContenedor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                  ),
                  child: FlatButton(
                    child: Icon(
                      Icons.panorama_fish_eye,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<PaginaPracticaCubit>()
                          .asignarSimboloANivel('circulo');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                  ),
                  child: FlatButton(
                    child: Center(
                      child: Divider(
                        color: Colors.white,
                        thickness: 6,
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<PaginaPracticaCubit>()
                          .asignarSimboloANivel('barra');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                  ),
                  child: FlatButton(
                    child: Icon(
                      Icons.panorama_photosphere_select,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<PaginaPracticaCubit>()
                          .asignarSimboloANivel('cacao');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                  ),
                  child: FlatButton(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Limpiar nivel',
                          style: TextStyle(color: Colors.white)),
                    ),
                    onPressed: () {
                      context
                          .read<PaginaPracticaCubit>()
                          .limpiarNivelSeleccionado();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
