import 'package:json_annotation/json_annotation.dart';

part 'birth_certificate.g.dart';

@JsonSerializable()
class BirthCertificate {
  bool isRussian;
  String series;
  int number;
  String dateOfGetting;
  String issueName;


  BirthCertificate(this.isRussian, this.series, this.number, this.dateOfGetting,
      this.issueName);

  factory BirthCertificate.fromJson(Map<String, dynamic> json) => _$BirthCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$BirthCertificateToJson(this);
}