class Hidratacao {

  String _dia;
  String _quantidade;
  String _falta;

  Hidratacao(this._dia, this._quantidade, this._falta);

  String get falta => _falta;

  set falta(String value) {
    _falta = value;
  }

  String get quantidade => _quantidade;

  set quantidade(String value) {
    _quantidade = value;
  }

  String get dia => _dia;

  set dia(String value) {
    _dia = value;
  }


}
