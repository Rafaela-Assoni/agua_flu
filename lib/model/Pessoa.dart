class Pessoa {

  String _nome;
  String _idade;
  String _profissao;
  String _foto;


  Pessoa(this._nome, this._idade, this._profissao, this._foto);

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get idade => _idade;

  String get foto => _foto;

  set foto(String value) {
    _foto = value;
  }

  String get profissao => _profissao;

  set profissao(String value) {
    _profissao = value;
  }

  set idade(String value) {
    _idade = value;
  }


}