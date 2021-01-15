class Nivel{
  final int circulos;
  final int barras;
  final int cacao;
  Nivel({this.circulos, this.barras, this.cacao});

  @override
  bool operator == (Object o){
    if(identical(this, o)) return true;
    return o is Nivel &&
    o.circulos == circulos &&
    o.barras == barras &&
    o.cacao == cacao;
  }

  @override
  int get hashcode =>
  circulos.hashCode ^
  barras.hashCode ^
  cacao.hashCode;
}