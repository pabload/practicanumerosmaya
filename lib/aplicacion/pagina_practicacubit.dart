import 'package:bloc/bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicaestado.dart';
import 'dart:math';

import 'package:practicanumerosmaya/dominio/nivel.dart';

class PaginaPracticaCubit extends Cubit<PaginaPracticaEstado> {
  PaginaPracticaCubit() : super(PaginaPracticaEstado.inicial());
  generarNuevoNumero() {
    emit(state.copyWith(verResultado:false));
    emit(state.copyWith(numeroAResolver:Random().nextInt(400) + 1));
    if (state.numeroAResolver > 19 && state.numeroAResolver != 400) {
      int cociente = (state.numeroAResolver / 20).toInt();
      int residuo = state.numeroAResolver % 20;
      asignarNumeroANivel(residuo, 1);
      asignarNumeroANivel(cociente, 2);
    } else {
      if (state.numeroAResolver == 400) {
        print('entro');
        emit(state.copyWith(
            nivel1: Nivel(cacao: 1, circulos: 0, barras: 0),
            nivel2: Nivel(cacao: 1, circulos: 0, barras: 0),
            nivel3: Nivel(circulos: 1, barras: 0, cacao: 0)));
      }
    }
    emit(state.copyWith(mayaADecimal: Random().nextBool()));
  }

  seleccionarNivel(int nivel) {
    print('seleccionado');
    emit(state.copyWith(nivelseleccionado: nivel));
  }

  asignarNumeroDecimal(int numero) {
    emit(state.copyWith(entradaDecimal: numero));
  }

  limpiarEntradas() {
    emit(state.copyWith(
        entradaDecimal: 0,
        nivelseleccionado:0,
        entradanivel2: Nivel(circulos: 0, barras: 0, cacao: 0),
        entradanivel3: Nivel(circulos: 0, barras: 0, cacao: 0),
        entradanivel1: Nivel(circulos: 0, barras: 0, cacao: 0)));
  }

  comprobarIgualdad() {
    if (state.mayaADecimal) {
      if (state.entradanivel1 == state.nivel1 &&
          state.entradanivel2 == state.nivel2 &&
          state.entradanivel3 == state.nivel3) {
        emit(state.copyWith(correcto:true,verResultado:true));
      } else {
        emit(state.copyWith(correcto:false,verResultado:true));
      }
    } else {
      if (state.entradaDecimal == state.numeroAResolver) {
        emit(state.copyWith(correcto:true,verResultado:true));
      } else {
        emit(state.copyWith(correcto:false,verResultado:true));
      }
    }
    limpiarEntradas();
  }

  limpiarNivelSeleccionado() {
    switch (state.nivelseleccionado) {
      case 1:
        emit(state.copyWith(
            entradanivel1: Nivel(cacao: 0, circulos: 0, barras: 0)));
        break;
      case 2:
        emit(state.copyWith(
            entradanivel2: Nivel(cacao: 0, circulos: 0, barras: 0)));
        break;
      case 3:
        emit(state.copyWith(
            entradanivel3: Nivel(cacao: 0, circulos: 0, barras: 0)));
        break;
      default:
    }
  }

  asignarSimboloANivel(String simbolo) {
    switch (state.nivelseleccionado) {
      case 1:
        if (simbolo == 'circulo') {
          if (state.entradanivel1.circulos < 4 &&
              state.entradanivel1.cacao == 0) {
            emit(state.copyWith(
                entradanivel1: Nivel(
                    barras: state.entradanivel1.barras,
                    cacao: state.entradanivel1.cacao,
                    circulos: state.entradanivel1.circulos + 1)));
          }
        }
        if (simbolo == 'barra') {
          if (state.entradanivel1.barras < 3 &&
              state.entradanivel1.cacao == 0) {
            emit(state.copyWith(
                entradanivel1: Nivel(
                    barras: state.entradanivel1.barras + 1,
                    cacao: state.entradanivel1.cacao,
                    circulos: state.entradanivel1.circulos)));
          }
        }
        if (simbolo == 'cacao') {
          if (state.entradanivel1.cacao < 1 &&
              state.entradanivel1.barras == 0 &&
              state.entradanivel1.circulos == 0) {
            emit(state.copyWith(
                entradanivel1: Nivel(
                    barras: state.entradanivel1.barras,
                    cacao: state.entradanivel1.cacao + 1,
                    circulos: state.entradanivel1.circulos)));
          }
        }
        break;
      case 2:
        if (simbolo == 'circulo') {
          if (state.entradanivel2.circulos < 4 &&
              state.entradanivel2.cacao == 0) {
            emit(state.copyWith(
                entradanivel2: Nivel(
                    barras: state.entradanivel2.barras,
                    cacao: state.entradanivel2.cacao,
                    circulos: state.entradanivel2.circulos + 1)));
          }
        }
        if (simbolo == 'barra') {
          if (state.entradanivel2.barras < 3 &&
              state.entradanivel2.cacao == 0) {
            emit(state.copyWith(
                entradanivel2: Nivel(
                    barras: state.entradanivel2.barras + 1,
                    cacao: state.entradanivel2.cacao,
                    circulos: state.entradanivel2.circulos)));
          }
        }
        if (simbolo == 'cacao') {
          if (state.entradanivel2.cacao < 1 &&
              state.entradanivel2.barras == 0 &&
              state.entradanivel2.circulos == 0) {
            emit(state.copyWith(
                entradanivel2: Nivel(
                    barras: state.entradanivel2.barras,
                    cacao: state.entradanivel2.cacao + 1,
                    circulos: state.entradanivel2.circulos)));
          }
        }
        break;
      case 3:
        if (simbolo == 'circulo') {
          if (state.entradanivel3.circulos < 4 &&
              state.entradanivel3.cacao == 0) {
            emit(state.copyWith(
                entradanivel3: Nivel(
                    barras: state.entradanivel3.barras,
                    cacao: state.entradanivel3.cacao,
                    circulos: state.entradanivel3.circulos + 1)));
          }
        }
        if (simbolo == 'barra') {
          if (state.entradanivel3.barras < 3 &&
              state.entradanivel3.cacao == 0) {
            emit(state.copyWith(
                entradanivel3: Nivel(
                    barras: state.entradanivel3.barras + 1,
                    cacao: state.entradanivel3.cacao,
                    circulos: state.entradanivel3.circulos)));
          }
        }
        if (simbolo == 'cacao') {
          if (state.entradanivel3.cacao < 1 &&
              state.entradanivel3.barras == 0 &&
              state.entradanivel3.circulos == 0) {
            emit(state.copyWith(
                entradanivel3: Nivel(
                    barras: state.entradanivel3.barras,
                    cacao: state.entradanivel3.cacao + 1,
                    circulos: state.entradanivel3.circulos)));
          }
        }
        break;
      default:
    }
  }

  asignarNumeroANivel(int numeroEnNivel, int nivel) {
    switch (numeroEnNivel) {
      case 0:
        Nivel valorEnMaya = Nivel(cacao: 1, circulos: 0, barras: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 1:
        Nivel valorEnMaya = Nivel(circulos: 1, barras: 0, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 2:
        Nivel valorEnMaya = Nivel(circulos: 2, barras: 0, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 3:
        Nivel valorEnMaya = Nivel(circulos: 3, barras: 0, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 4:
        Nivel valorEnMaya = Nivel(circulos: 4, barras: 0, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 5:
        Nivel valorEnMaya = Nivel(barras: 1, circulos: 0, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 6:
        Nivel valorEnMaya = Nivel(barras: 1, circulos: 1, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 7:
        Nivel valorEnMaya = Nivel(barras: 1, circulos: 2, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 8:
        Nivel valorEnMaya = Nivel(barras: 1, circulos: 3, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 9:
        Nivel valorEnMaya = Nivel(barras: 1, circulos: 4, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 10:
        Nivel valorEnMaya = Nivel(barras: 2, circulos: 0, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 11:
        Nivel valorEnMaya = Nivel(barras: 2, circulos: 1, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 12:
        Nivel valorEnMaya = Nivel(barras: 2, circulos: 2, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 13:
        Nivel valorEnMaya = Nivel(barras: 2, circulos: 3, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 14:
        Nivel valorEnMaya = Nivel(barras: 2, circulos: 4, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 15:
        Nivel valorEnMaya = Nivel(barras: 3, circulos: 0, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 16:
        Nivel valorEnMaya = Nivel(barras: 3, circulos: 1, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 17:
        Nivel valorEnMaya = Nivel(barras: 3, circulos: 2, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 18:
        Nivel valorEnMaya = Nivel(barras: 3, circulos: 3, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
      case 19:
        Nivel valorEnMaya = Nivel(barras: 3, circulos: 4, cacao: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivel1: valorEnMaya));
        } else {
          emit(state.copyWith(nivel2: valorEnMaya));
        }
        break;
    }
  }
}
