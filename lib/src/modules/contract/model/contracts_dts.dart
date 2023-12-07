// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/const/const.dart';
import 'package:marcacion_admin/src/common/services/navigation_service.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';
import 'package:marcacion_admin/src/modules/contract/viewmodel/contracts_provider.dart';
import 'package:provider/provider.dart';

class ContractsTDS extends DataTableSource {
  final List<dynamic> contracts;
  final BuildContext context;
  final int total;

  ContractsTDS(this.contracts, this.context, this.total);

  @override
  DataRow? getRow(int index) {
    final contract = contracts[index];
    return DataRow.byIndex(
      color:
          MaterialStateColor.resolveWith((states) => const Color(0XFFFFFFFF)),
      index: index,
      cells: [
        DataCell(Text("contract.empCodigo")),
        DataCell(Text("contract.empNombres")),
        DataCell(Text("contract.empApellidos")),
        DataCell(Text("contract.empFechaNacimiento")),
        DataCell(Text("contract.marcaGenGenero.genNombre")),
        DataCell(Text("contract.marcaCnContratacion.cnNombre")),
        DataCell(Text("contract.marcaUbiUbicacion.ubiNombre")),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // NavigationService.navigateTo(
                  //     "/employes/update/${contract.marcaEmpPk}");
                },
                icon: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset("assets/icons/editarsvg.png"),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: Column(
                      children: [
                        Image.asset("assets/icons/borrarred.png"),
                        Text(
                          'Eliminar ${contract.empNombres}',
                          style: const TextStyle(color: error),
                        ),
                      ],
                    ),
                    content: const Text(
                      '¿Confirmas que deseas eliminar a este empleado?',
                      style: TextStyle(color: primary),
                    ),
                    actions: [
                      Row(
                        children: [
                          BtnOutlineWidget(
                            title: 'Cancelar',
                            onPress: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          BtnWidget(
                            title: "Si, Eliminar",
                            width: 200,
                            onPress: () async {
                              await Provider.of<ContractsProvider>(context,
                                      listen: false)
                                  .deleteContracts(contract.marcaEmpPk);

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  );

                  showDialog(context: context, builder: (_) => dialog);
                },
                icon: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: error,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset("assets/icons/delete.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => total;

  @override
  int get selectedRowCount => 0;
}
