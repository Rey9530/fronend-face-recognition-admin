class ContratationResp {
  final List<Contratation> data;
  final int status;
  final String message;

  ContratationResp({
    required this.data,
    required this.status,
    required this.message,
  });

  factory ContratationResp.fromJson(Map<String, dynamic> json) =>
      ContratationResp(
        data: List<Contratation>.from(
            json["data"].map((x) => Contratation.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Contratation {
  final String marcaCnPk;
  final String cnNombre;

  Contratation({
    required this.marcaCnPk,
    required this.cnNombre,
  });

  factory Contratation.fromJson(Map<String, dynamic> json) => Contratation(
        marcaCnPk: json["marca_cn_pk"],
        cnNombre: json["cn_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "marca_cn_pk": marcaCnPk,
        "cn_nombre": cnNombre,
      };
}
