import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marcacion_admin/src/common/const/const.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/models/dropdown_buttom_data_model.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';
import 'package:marcacion_admin/src/modules/employees/viewmodel/employes_provider.dart';
import 'package:provider/provider.dart';

class AddEmployeView extends StatelessWidget {
  const AddEmployeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [
          BreadCrumWidget(
            title: 'Empleados / Nuevo empleado',
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: GoBackWidget(),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Completa los campos. Al terminar da clic en el botón “Guardar”.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 50),
          _FormewEmployeWidget()
        ],
      ),
    );
  }
}

class _FormewEmployeWidget extends StatelessWidget {
  const _FormewEmployeWidget();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EmployesProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Wrap(
        //   alignment: WrapAlignment.start,
        //   children: [

        //   ],
        // ),
        SizedBox(
          width: 1100,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Container(
                      padding: const EdgeInsets.only(top: 7),
                      child: const Icon(
                        Icons.info_outline,
                        size: 36,
                      ),
                    ),
                    Text(
                      "Código: ",
                      style: TextStyle(
                        color: getTheme(context).primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    const Text(
                      "TER-890501",
                      style: TextStyle(
                        color: textGraySubtitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 400,
                child: TextFormFieldCustomWidget(
                  isDark: true,
                  label: "Nombres",
                  hinText: 'Escribe los nombres del nuevo empleado',
                  controller: provider.employeName,
                  onChange: (valor) {
                    // provider.validarInput();
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 400,
                child: TextFormFieldCustomWidget(
                  isDark: true,
                  label: "Apellidos",
                  hinText: 'Escribe los apellidos del nuevo empleado',
                  controller: provider.employeSurname,
                  onChange: (valor) {
                    // provider.validarInput();
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 200,
                child: TextFormFieldCustomWidget(
                  isDark: true,
                  label: "Fecha de nacimiento",
                  hinText: '00/00/000',
                  controller: provider.employeBirthdate,
                  onChange: (valor) {
                    // provider.validarInput();
                  },
                  suffixIcon: InkWell(
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now().add(
                          const Duration(days: -6570),
                        ),
                        // barrierDismissible: false,
                        initialEntryMode: DatePickerEntryMode.inputOnly,
                        locale: const Locale('es', 'ES'),
                      );
                      if (data != null) {
                        String onlydate = DateFormat("dd/MM/yyyy").format(data);
                        provider.employeBirthdate.text = onlydate;
                      }
                    },
                    child: Image.asset("assets/icons/calendar_primary.png"),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 405,
                child: const SelectGenderWidget(),
              ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   width: 620,
              //   child: _SelectCompaniesWidget(
              //     controller: provider.employeLocation,
              //     title: 'Sede asignada',
              //     onChange: (val) {
              //       print(val);
              //     },
              //     items: [
              //       DropdownButtonData(title: 'Selecciona una opción', id: '0'),
              //       DropdownButtonData(id: '1', title: '1'),
              //       DropdownButtonData(id: '2', title: '2'),
              //       DropdownButtonData(id: '3', title: '3'),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   width: 400,
              //   child: _SelectCompaniesWidget(
              //     controller: provider.employeCompany,
              //     title: 'Empresa',
              //     onChange: (val) {
              //       print(val);
              //     },
              //     items: [
              //       DropdownButtonData(title: 'Selecciona una opción', id: '0'),
              //       DropdownButtonData(id: '1', title: '1'),
              //       DropdownButtonData(id: '2', title: '2'),
              //       DropdownButtonData(id: '3', title: '3'),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   width: 400,
              //   child: _SelectCompaniesWidget(
              //     controller: provider.employeContact,
              //     title: 'Código de contrato',
              //     onChange: (val) {
              //       print(val);
              //     },
              //     items: [
              //       DropdownButtonData(title: 'Selecciona una opción', id: '0'),
              //       DropdownButtonData(id: '1', title: '1'),
              //       DropdownButtonData(id: '2', title: '2'),
              //       DropdownButtonData(id: '3', title: '3'),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   width: 200,
              //   child: _SelectCompaniesWidget(
              //     controller: provider.employeHours,
              //     title: 'Horario',
              //     onChange: (val) {
              //       print(val);
              //     },
              //     items: [
              //       DropdownButtonData(title: 'Selecciona una opción', id: '0'),
              //       DropdownButtonData(id: '1', title: '1'),
              //       DropdownButtonData(id: '2', title: '2'),
              //       DropdownButtonData(id: '3', title: '3'),
              //     ],
              //   ),
              // ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 400,
                child: _SelectCompaniesWidget(
                  controller: provider.employeContratation,
                  title: 'Tipo de contratación',
                  onChange: (val) {
                    print(val);
                  },
                  items: [
                    // DropdownButtonData(title: 'Selecciona una opción', id: '0'),
                    // DropdownButtonData(id: '1', title: '1'),
                    DropdownButtonData(id: '2', title: '2'),
                    DropdownButtonData(id: '3', title: '3'),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 400,
                child: TextFormFieldCustomWidget(
                  isDark: true,
                  label: "Fecha de inicio",
                  hinText: '00/00/000',
                  controller: provider.employeBirthdate,
                  onChange: (valor) {
                    // provider.validarInput();
                  },
                  suffixIcon: InkWell(
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now().add(
                          const Duration(days: -6570),
                        ),
                        // barrierDismissible: false,
                        initialEntryMode: DatePickerEntryMode.inputOnly,
                        locale: const Locale('es', 'ES'),
                      );
                      if (data != null) {
                        String onlydate = DateFormat("dd/MM/yyyy").format(data);
                        provider.employeDateStart.text = onlydate;
                      }
                    },
                    child: Image.asset("assets/icons/calendar_primary.png"),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 200,
                child: TextFormFieldCustomWidget(
                  isDark: true,
                  label: "Fecha de fin",
                  hinText: '00/00/000',
                  controller: provider.employeBirthdate,
                  onChange: (valor) {
                    // provider.validarInput();
                  },
                  suffixIcon: InkWell(
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now().add(
                          const Duration(days: -6570),
                        ),
                        // barrierDismissible: false,
                        initialEntryMode: DatePickerEntryMode.inputOnly,
                        locale: const Locale('es', 'ES'),
                      );
                      if (data != null) {
                        String onlydate = DateFormat("dd/MM/yyyy").format(data);
                        provider.employeDateStart.text = onlydate;
                      }
                    },
                    child: Image.asset("assets/icons/calendar_primary.png"),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: BtnWidget(
                  width: 200,
                  height: 60,
                  title: "Guardar",
                  onPress: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({
    super.key,
  });

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Mujer",
          style: TextStyle(
            color: getTheme(context).primary,
            fontSize: 20,
          ),
        ),
        Radio(
          value: 1,
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = int.parse(v.toString());
            });
          },
        ),
        const Spacer(),
        Text(
          "Hombre",
          style: TextStyle(
            color: getTheme(context).primary,
            fontSize: 20,
          ),
        ),
        Radio(
          value: 2,
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = int.parse(v.toString());
            });
          },
        ),
        const Spacer(),
      ],
    );
  }
}

class GoBackWidget extends StatelessWidget {
  const GoBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: InkWell(
        onTap: () {
          NavigationService.goBack();
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: getTheme(context).primary,
              size: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              "Regresar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class _SelectCompaniesWidget extends StatefulWidget {
  const _SelectCompaniesWidget({
    required this.controller,
    required this.title,
    required this.items,
    this.selected,
    this.onChange,
  });
  final List<DropdownButtonData>? items;
  final DropdownButtonData? selected;
  final String title;
  final TextEditingController controller;
  final Function(DropdownButtonData)? onChange;

  @override
  State<_SelectCompaniesWidget> createState() => _SelectCompaniesWidgetState();
}

class _SelectCompaniesWidgetState extends State<_SelectCompaniesWidget> {
  // Initial Selected Value
  DropdownButtonData dropdownvalue = DropdownButtonData(
    title: 'Selecciona una opción',
    id: '0',
  );

  // List of items in our dropdown menu
  List<DropdownButtonData> items = [
    // DropdownButtonData(title: 'Selecciona una opción', id: '0'),
  ];
  @override
  void initState() {
    super.initState();
    if (widget.selected != null) {
      dropdownvalue = widget.selected!;
    }
    items =
        (widget.items != null && widget.items!.isNotEmpty) ? widget.items! : [];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<DropdownButtonData>(
      value: dropdownvalue,
      isExpanded: true,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      borderRadius: BorderRadius.circular(4),
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle: TextStyle(
          color: getTheme(context).primary,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: getTheme(context).tertiary.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: getTheme(context).primary,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: getTheme(context).primary,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      // Array list of items
      items: items.map((DropdownButtonData item) {
        var resp = items.where((element) => item == element);
        print("items.id: ${resp.first.id}");
        return DropdownMenuItem<DropdownButtonData>(
          value: item,
          child: Text(
            item.title,
            style: TextStyle(
              color: getTheme(context).primary,
            ),
          ),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (DropdownButtonData? newValue) {
        if (widget.onChange != null) {
          widget.onChange!(newValue!);
        }
        if (newValue != null) {
          setState(() {
            dropdownvalue = newValue;
            widget.controller.text = newValue.id;
          });
        }
      },
    );
  }
}
