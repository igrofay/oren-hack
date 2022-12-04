

import 'package:dooking/data/models/parent.dart';
import 'package:dooking/data/models/passport.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../repos/parent.dart';

part 'parent_form.g.dart';

@injectable
class ParentForm = _ParentForm with _$ParentForm;

enum StateParentForm{ load, success }

abstract class _ParentForm with Store{
  final ParentRepos _parentRepos;
  _ParentForm(this._parentRepos){
    _load();
  }

  @observable
  StateParentForm state = StateParentForm.load;

  @action
  Future<void> _load() async {
     try{
       final parentInfo = await _parentRepos.getParent();
       fio = parentInfo.fio;
       parentStatus = parentInfo.parentStatus;
       citizenCountry = parentInfo.citizenCountry;
       birthday = parentInfo.birthday;
       phoneNumber = parentInfo.phoneNumber;
       seriesPassport = parentInfo.passport.series.toString();
       numberPassport = parentInfo.passport.number.toString();
       dateOfGettingPassport = parentInfo.passport.dateOfGetting;
       issueName = parentInfo.passport.issueName;
       snils = parentInfo.snils;
       address = parentInfo.address;
       state = StateParentForm.success;
       email = parentInfo.email;
     }catch(_){}
    state = StateParentForm.success;
  }

  String email = "";

  /// Общее
  String fio = '';

  @observable
  bool isErrorFIO = false;

  @observable
  String parentStatus = 'Родитель';

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

  String seriesPassport = '';

  @observable
  bool isErrorSeriesPassport = false;

  String numberPassport = '';

  @observable
  bool isErrorNumberPassport = false;

  @observable
  String dateOfGettingPassport = '';

  @observable
  bool isErrorDateOfGettingPassport  = false;

  @observable
  bool showCalendarDateOfGettingPassport = false;

  String issueName = '';

  @observable
  bool isErrorIssueName = false;

  String snils = '';

  @observable
  bool isErrorSnils = false;

  /// Документы
  /// Адресс

  String address = '';

  @observable
  bool isErrorAddress = false;

  /// Адресс

  Future<void> save() async {
   try{
     _parentRepos.saveParent(
         Parent(
             fio, parentStatus, citizenCountry, birthday,
             Passport(int.parse(seriesPassport), int.parse(numberPassport), dateOfGettingPassport, issueName, true),
             address, snils, phoneNumber, email)
     );
   }catch(e){

   }
  }

}