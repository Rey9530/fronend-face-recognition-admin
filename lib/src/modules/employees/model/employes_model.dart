import 'package:intl/intl.dart';

class EmployesResponse {
  final RespData data;
  final int status;
  final String message;

  EmployesResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory EmployesResponse.fromJson(Map<String, dynamic> json) =>
      EmployesResponse(
        data: RespData.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "message": message,
      };
}

class RespData {
  final List<Employe> employes;
  final Pagination pagination;

  RespData({
    required this.employes,
    required this.pagination,
  });

  factory RespData.fromJson(Map<String, dynamic> json) => RespData(
        employes: List<Employe>.from(
            json["employes"].map((x) => Employe.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "employes": List<dynamic>.from(employes.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Employe {
  final String marcaEmpPk;
  final String empCodigo;
  final String empFechaNacimiento;
  final String empNombres;
  final String empApellidos;
  final String empEstado;
  final String marcaEmpEmpreFk;
  final DateTime empFeccrea;
  final DateTime empFecmod;
  final String empUsrcrea;
  final String empUsrmod;
  final String marcaEmpGenFk;
  final String marcaEmpUbiFk;
  final String marcaEmpCnFk;
  final MarcaGenGenero marcaGenGenero;
  final List<dynamic> marcaAsigAsignacion;
  final MarcaCnContratacion marcaCnContratacion;
  final MarcaUbiUbicacion marcaUbiUbicacion;

  Employe({
    required this.marcaEmpPk,
    required this.empCodigo,
    required this.empFechaNacimiento,
    required this.empNombres,
    required this.empApellidos,
    required this.empEstado,
    required this.marcaEmpEmpreFk,
    required this.empFeccrea,
    required this.empFecmod,
    required this.empUsrcrea,
    required this.empUsrmod,
    required this.marcaEmpGenFk,
    required this.marcaEmpUbiFk,
    required this.marcaEmpCnFk,
    required this.marcaGenGenero,
    required this.marcaAsigAsignacion,
    required this.marcaCnContratacion,
    required this.marcaUbiUbicacion,
  });

  factory Employe.fromJson(Map<String, dynamic> json) => Employe(
        marcaEmpPk: json["marca_emp_pk"],
        empCodigo: json["emp_codigo"],
        empFechaNacimiento: DateFormat("dd/MM/y")
            .format(DateTime.parse(json["emp_fecha_nacimiento"])),
        empNombres: json["emp_nombres"],
        empApellidos: json["emp_apellidos"],
        empEstado: json["emp_estado"],
        marcaEmpEmpreFk: json["marca_emp_empre_fk"],
        empFeccrea: DateTime.parse(json["emp_feccrea"]),
        empFecmod: DateTime.parse(json["emp_fecmod"]),
        empUsrcrea: json["emp_usrcrea"],
        empUsrmod: json["emp_usrmod"],
        marcaEmpGenFk: json["marca_emp_gen_fk"],
        marcaEmpUbiFk: json["marca_emp_ubi_fk"],
        marcaEmpCnFk: json["marca_emp_cn_fk"],
        marcaGenGenero: MarcaGenGenero.fromJson(json["marca_gen_genero"]),
        marcaAsigAsignacion:
            List<dynamic>.from(json["marca_asig_asignacion"].map((x) => x)),
        marcaCnContratacion:
            MarcaCnContratacion.fromJson(json["marca_cn_contratacion"]),
        marcaUbiUbicacion:
            MarcaUbiUbicacion.fromJson(json["marca_ubi_ubicacion"]),
      );

  Map<String, dynamic> toJson() => {
        "marca_emp_pk": marcaEmpPk,
        "emp_codigo": empCodigo,
        "emp_fecha_nacimiento": empFechaNacimiento,
        "emp_nombres": empNombres,
        "emp_apellidos": empApellidos,
        "emp_estado": empEstado,
        "marca_emp_empre_fk": marcaEmpEmpreFk,
        "emp_feccrea": empFeccrea.toIso8601String(),
        "emp_fecmod": empFecmod.toIso8601String(),
        "emp_usrcrea": empUsrcrea,
        "emp_usrmod": empUsrmod,
        "marca_emp_gen_fk": marcaEmpGenFk,
        "marca_emp_ubi_fk": marcaEmpUbiFk,
        "marca_emp_cn_fk": marcaEmpCnFk,
        "marca_gen_genero": marcaGenGenero.toJson(),
        "marca_asig_asignacion":
            List<dynamic>.from(marcaAsigAsignacion.map((x) => x)),
        "marca_cn_contratacion": marcaCnContratacion.toJson(),
        "marca_ubi_ubicacion": marcaUbiUbicacion.toJson(),
      };
}

class MarcaCnContratacion {
  final String marcaCnPk;
  final String cnNombre;
  final String cnEstado;
  final DateTime cnFeccrea;
  final DateTime cnFecmod;
  final String cnUsrcrea;
  final String cnUsrmod;

  MarcaCnContratacion({
    required this.marcaCnPk,
    required this.cnNombre,
    required this.cnEstado,
    required this.cnFeccrea,
    required this.cnFecmod,
    required this.cnUsrcrea,
    required this.cnUsrmod,
  });

  factory MarcaCnContratacion.fromJson(Map<String, dynamic> json) =>
      MarcaCnContratacion(
        marcaCnPk: json["marca_cn_pk"],
        cnNombre: json["cn_nombre"],
        cnEstado: json["cn_estado"],
        cnFeccrea: DateTime.parse(json["cn_feccrea"]),
        cnFecmod: DateTime.parse(json["cn_fecmod"]),
        cnUsrcrea: json["cn_usrcrea"],
        cnUsrmod: json["cn_usrmod"],
      );

  Map<String, dynamic> toJson() => {
        "marca_cn_pk": marcaCnPk,
        "cn_nombre": cnNombre,
        "cn_estado": cnEstado,
        "cn_feccrea": cnFeccrea.toIso8601String(),
        "cn_fecmod": cnFecmod.toIso8601String(),
        "cn_usrcrea": cnUsrcrea,
        "cn_usrmod": cnUsrmod,
      };
}

class MarcaGenGenero {
  final String marcaGenPk;
  final String genNombre;
  final String genEstado;
  final DateTime genFeccrea;
  final DateTime genFecmod;
  final String genUsrcrea;
  final String genUsrmod;

  MarcaGenGenero({
    required this.marcaGenPk,
    required this.genNombre,
    required this.genEstado,
    required this.genFeccrea,
    required this.genFecmod,
    required this.genUsrcrea,
    required this.genUsrmod,
  });

  factory MarcaGenGenero.fromJson(Map<String, dynamic> json) => MarcaGenGenero(
        marcaGenPk: json["marca_gen_pk"],
        genNombre: json["gen_nombre"],
        genEstado: json["gen_estado"],
        genFeccrea: DateTime.parse(json["gen_feccrea"]),
        genFecmod: DateTime.parse(json["gen_fecmod"]),
        genUsrcrea: json["gen_usrcrea"],
        genUsrmod: json["gen_usrmod"],
      );

  Map<String, dynamic> toJson() => {
        "marca_gen_pk": marcaGenPk,
        "gen_nombre": genNombre,
        "gen_estado": genEstado,
        "gen_feccrea": genFeccrea.toIso8601String(),
        "gen_fecmod": genFecmod.toIso8601String(),
        "gen_usrcrea": genUsrcrea,
        "gen_usrmod": genUsrmod,
      };
}

class MarcaUbiUbicacion {
  final String marcaUbiPk;
  final String ubiNombre;
  final String ubiEstado;
  final DateTime ubiFeccrea;
  final DateTime ubiFecmod;
  final String ubiUsrcrea;
  final String ubiUsrmod;

  MarcaUbiUbicacion({
    required this.marcaUbiPk,
    required this.ubiNombre,
    required this.ubiEstado,
    required this.ubiFeccrea,
    required this.ubiFecmod,
    required this.ubiUsrcrea,
    required this.ubiUsrmod,
  });

  factory MarcaUbiUbicacion.fromJson(Map<String, dynamic> json) =>
      MarcaUbiUbicacion(
        marcaUbiPk: json["marca_ubi_pk"],
        ubiNombre: json["ubi_nombre"],
        ubiEstado: json["ubi_estado"],
        ubiFeccrea: DateTime.parse(json["ubi_feccrea"]),
        ubiFecmod: DateTime.parse(json["ubi_fecmod"]),
        ubiUsrcrea: json["ubi_usrcrea"],
        ubiUsrmod: json["ubi_usrmod"],
      );

  Map<String, dynamic> toJson() => {
        "marca_ubi_pk": marcaUbiPk,
        "ubi_nombre": ubiNombre,
        "ubi_estado": ubiEstado,
        "ubi_feccrea": ubiFeccrea.toIso8601String(),
        "ubi_fecmod": ubiFecmod.toIso8601String(),
        "ubi_usrcrea": ubiUsrcrea,
        "ubi_usrmod": ubiUsrmod,
      };
}

class Pagination {
  final int page;
  final int quantity;
  final int total;

  Pagination({
    required this.page,
    required this.quantity,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        quantity: json["quantity"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "quantity": quantity,
        "total": total,
      };
}
