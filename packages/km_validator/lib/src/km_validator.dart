import 'package:get/get.dart';
import 'package:km_shared/km_shared.dart';

class KmNameValidator {
  const KmNameValidator();

  static String? validateName(String name) {
    if (name.isEmpty) {
      return KmConstant.emptyFieldGeneral.trParams({KmConstant.value1: 'Nama'});
    } else if (name.length < 3) {
      return KmConstant.minimumFieldGeneral.trParams({KmConstant.value1: 'Nama', KmConstant.value2: '3'});
    } else {
      return null;
    }
  }
}

class KmEmailValidator {
  const KmEmailValidator();

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return KmConstant.emptyFieldGeneral.trParams({KmConstant.value1: 'Email'});
    } else if (!GetUtils.isEmail(email)) {
      return KmConstant.emailNotValid.tr;
    } else {
      return null;
    }
  }
}

class KmPasswordValidator {
  const KmPasswordValidator();

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return KmConstant.emptyFieldGeneral.trParams({KmConstant.value1: 'Password'});
    } else if (password.length <= 8) {
      return KmConstant.emailNotValid.tr;
    } else {
      return null;
    }
  }

  static String? validateConfPassword({required String password, required String confPassword}) {
    if (confPassword.isEmpty) {
      return KmConstant.emptyFieldGeneral.trParams({KmConstant.value1: 'Konfirmasi Password'});
    } else if (confPassword != password) {
      return KmConstant.confPasswordNotMatch.tr;
    } else {
      return null;
    }
  }
}
