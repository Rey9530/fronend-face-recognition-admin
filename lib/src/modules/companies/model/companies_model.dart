class CompaniesResponse {
  final List<Companie> data;
  final int status;
  final String message;

  CompaniesResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) =>
      CompaniesResponse(
        data:
            List<Companie>.from(json["data"].map((x) => Companie.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Companie {
  final String marcaEmprePk;
  final String empreNombre;
  final String empreDireccion;
  final String empreContactoNombre;
  final String empreContactoCorreo;
  final String empreContactoTelefono;
  final String empreUsrcrea;
  final String empreUsrmod;
  final DateTime empreFeccrea;
  final DateTime empreFecmod;
  final String empreEstado;
  final String marcaEmpreUsrFk;

  Companie({
    required this.marcaEmprePk,
    required this.empreNombre,
    required this.empreDireccion,
    required this.empreContactoNombre,
    required this.empreContactoCorreo,
    required this.empreContactoTelefono,
    required this.empreUsrcrea,
    required this.empreUsrmod,
    required this.empreFeccrea,
    required this.empreFecmod,
    required this.empreEstado,
    required this.marcaEmpreUsrFk,
  });

  factory Companie.fromJson(Map<String, dynamic> json) => Companie(
        marcaEmprePk: json["marca_empre_pk"] ?? '',
        empreNombre: json["empre_nombre"] ?? '',
        empreDireccion: json["empre_direccion"] ?? '',
        empreContactoNombre: json["empre_contacto_nombre"] ?? '',
        empreContactoCorreo: json["empre_contacto_correo"] ?? '',
        empreContactoTelefono: json["empre_contacto_telefono"] ?? '',
        empreUsrcrea: json["empre_usrcrea"] ?? '',
        empreUsrmod: json["empre_usrmod"] ?? '',
        empreEstado: json["empre_estado"] ?? '',
        marcaEmpreUsrFk: json["marca_empre_usr_fk"] ?? '',
        empreFeccrea: json["empre_feccrea"] != null
            ? DateTime.parse(json["empre_feccrea"])
            : DateTime.now(),
        empreFecmod: json["empre_fecmod"] != null
            ? DateTime.parse(json["empre_fecmod"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "marca_empre_pk": marcaEmprePk,
        "empre_nombre": empreNombre,
        "empre_direccion": empreDireccion,
        "empre_contacto_nombre": empreContactoNombre,
        "empre_contacto_correo": empreContactoCorreo,
        "empre_contacto_telefono": empreContactoTelefono,
        "empre_usrcrea": empreUsrcrea,
        "empre_usrmod": empreUsrmod,
        "empre_feccrea": empreFeccrea.toIso8601String(),
        "empre_fecmod": empreFecmod.toIso8601String(),
        "empre_estado": empreEstado,
        "marca_empre_usr_fk": marcaEmpreUsrFk,
      };
}
