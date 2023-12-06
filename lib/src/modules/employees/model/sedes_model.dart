class SedesResp {
  final List<Sede> data;
  final int status;
  final String message;

  SedesResp({
    required this.data,
    required this.status,
    required this.message,
  });

  factory SedesResp.fromJson(Map<String, dynamic> json) => SedesResp(
        data: List<Sede>.from(json["data"].map((x) => Sede.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Sede {
  final String marcaUbiPk;
  final String ubiNombre;

  Sede({
    required this.marcaUbiPk,
    required this.ubiNombre,
  });

  factory Sede.fromJson(Map<String, dynamic> json) => Sede(
        marcaUbiPk: json["marca_ubi_pk"],
        ubiNombre: json["ubi_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "marca_ubi_pk": marcaUbiPk,
        "ubi_nombre": ubiNombre,
      };
}
