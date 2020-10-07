String validarNome(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (!regExp.hasMatch(value)) {
    return "'Nome' invalido";
  }

  return null;
}

String validarCelular(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (!regExp.hasMatch(value)) {
    return "Celular invalido";
  }

  return null;
}

String validarEmail(String value) {
  if (value.isEmpty) {
    return 'Compo não pode ser vazio';
  } else if (value.length <= 3) {
    return "'E-mail' deve ter acima de 3 letras";
  }

  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return "Email inválido";
  }

  return null;
}
