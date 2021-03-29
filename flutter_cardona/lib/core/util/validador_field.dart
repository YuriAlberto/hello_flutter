class ValidadorCampo {
  bool isEmailvalido(String string) {
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  bool isCampoSinNul(String string) {
    if (string == null || string.isEmpty) {
      return false;
    }
    return true;
  }
}
