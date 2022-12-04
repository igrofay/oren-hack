

import 'package:dooking/data/models/child.dart';
import 'package:mobx/mobx.dart';

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
    if(fioSplit.length == 3){
      isErrorFIO = true;
      return;
    }
    if(child != null){

    }else{
      child = Child(fio[1], fio[0], fio[2], citizenCountry, birthday,
          null, null,
          address, snils, phoneNumber, email, null
      );
      child?.id = await _parentRepos.putNewChild(child!);
    }
  }
}