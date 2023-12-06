import 'package:marcacion_admin/src/modules/companies/model/companies_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/contratation_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/gender_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/sedes_model.dart';

class CatalogResponse {
  final CatalogData data;
  final int status;
  final String message;

  CatalogResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory CatalogResponse.fromJson(Map<String, dynamic> json) =>
      CatalogResponse(
        data: CatalogData.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "message": message,
      };
}

class CatalogData {
  final List<Sede> sedes;
  final List<Contratation> contratation;
  final List<Gender> gender;
  final List<Companie> companies;

  CatalogData({
    required this.sedes,
    required this.contratation,
    required this.gender,
    required this.companies,
  });

  factory CatalogData.fromJson(Map<String, dynamic> json) => CatalogData(
        sedes: List<Sede>.from(
          json["sedes"].map(
            (x) => Sede.fromJson(x),
          ),
        ),
        contratation: List<Contratation>.from(
          json["contratation"].map(
            (x) => Contratation.fromJson(x),
          ),
        ),
        gender: List<Gender>.from(
          json["gender"].map(
            (x) => Gender.fromJson(x),
          ),
        ),
        companies: List<Companie>.from(
          json["companies"].map(
            (x) => Companie.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "sedes": List<dynamic>.from(sedes.map((x) => x.toJson())),
        "contratation": List<dynamic>.from(contratation.map((x) => x.toJson())),
        "gender": List<dynamic>.from(gender.map((x) => x.toJson())),
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}
