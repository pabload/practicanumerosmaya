import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practicanumerosmaya/dominio/nivel.dart';
part 'pagina_practicaestado.freezed.dart';

@freezed
abstract class PaginaPracticaEstado with _$PaginaPracticaEstado {
  factory PaginaPracticaEstado({
    @required int numeroAResolver,
    @required bool mayaADecimal,
    @required int nivelseleccionado,
    @required Nivel nivel1,
    @required Nivel nivel2,
    @required Nivel nivel3,
    @required Nivel entradanivel1,
    @required Nivel entradanivel2,
    @required Nivel entradanivel3,
    @required int entradaDecimal,
    @required bool correcto,
    @required bool verResultado,
  }) = _PaginaPracticaEstado;
  factory PaginaPracticaEstado.inicial() => PaginaPracticaEstado(
      numeroAResolver: 0,
      mayaADecimal: false,
      nivelseleccionado: 0,
      nivel1: Nivel(circulos: 0, barras: 0, cacao: 0),
      nivel2: Nivel(circulos: 0, barras: 0, cacao: 0),
      nivel3: Nivel(circulos: 0, barras: 0, cacao: 0),
      entradanivel1: Nivel(circulos: 0, barras: 0, cacao: 0),
      entradanivel2: Nivel(circulos: 0, barras: 0, cacao: 0),
      entradanivel3: Nivel(circulos: 0, barras: 0, cacao: 0),
      entradaDecimal: 0,
      correcto: false,
      verResultado: false);
}
