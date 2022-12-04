

import 'package:dooking/data/models/child.dart';
import 'package:dooking/data/models/passport.dart';
import 'package:mobx/mobx.dart';

import '../../../data/models/birth_certificate.dart';
import '../../repos/parent.dart';

part 'child_form.g.dart';

class ChildForm = _ChildForm with _$ChildForm;

abstract class _ChildForm with Store{
  Child? child;
  final ParentRepos _parentRepos;

  _ChildForm(this.child, this._parentRepos, ){

  }

  /// Общее
  String fio = '';

  @observable
  bool isErrorFIO = false;

  String email = '';

  @observable
  bool isErrorEmail = false;

  String citizenCountry = '';

  @observable
  bool isErrorCitizenCountry  = false;

  @observable
  String birthday = '';

  @observable
  bool isErrorBirthday  = false;

  @observable
  bool showCalendarBirthday = false;

  String phoneNumber = '';

  @observable
  bool isErrorPhoneNumber = false;
  /// Общее
  /// Документы
  String snils = '';

  @observable
  bool isErrorSnils = false;


  @observable
  bool isPassport = true;

  String series = '';

  @observable
  bool isErrorSeries = false;

  String number = '';

  @observable
  bool isErrorNumber = false;

  @observable
  String dateOfGetting = '';

  @observable
  bool isErrorDateOfGetting  = false;

  @observable
  bool showCalendarDateOfGetting = false;

  String issueName = '';

  @observable
  bool isErrorIssueName = false;
  /// Документы
  /// Адресс

  String address = '';

  @observable
  bool isErrorAddress = false;

  /// Адресс
  @action
  Future<void> save() async {
    final fioSplit = fio.split(' ');
    print('1');
    if(fioSplit.length != 3){
      isErrorFIO = true;
      return;
    }
    print('2');
    if(child != null){

    }else{
      print('3');
      Passport? passport = isPassport
          ? Passport(int.parse(series), int.parse(number), dateOfGetting, issueName, true)
          : null;
      BirthCertificate? cer = isPassport ? null
          : BirthCertificate(true, series, int.parse(number), dateOfGetting, issueName);
      child = Child(fioSplit[1], fioSplit[0], fioSplit[2], citizenCountry, birthday,
          passport,
          cer,
          address, snils, phoneNumber, null
      );
      child?.id = await _parentRepos.putNewChild(child!);
    }
  }
}