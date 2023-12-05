import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/const/const.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';
import 'package:marcacion_admin/src/modules/employees/model/employes_dts.dart';
import 'package:marcacion_admin/src/modules/employees/viewmodel/employes_provider.dart';
import 'package:marcacion_admin/src/routes/router.dart';
import 'package:provider/provider.dart';

class EmployesView extends StatelessWidget {
  const EmployesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmployesProvider()),
      ],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: const [
            BreadCrumWidget(
              title: 'Empleados',
            ),
            _BodyEmployes(),
          ],
        ),
      ),
    );
  }
}

class _BodyEmployes extends StatelessWidget {
  const _BodyEmployes();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          _BtnNewEmployedWidget(),
          SizedBox(height: 20),
          _TextParraWidget(),
          SizedBox(height: 20),
          _FilterEmployesWidget(),
          SizedBox(height: 20),
          _ListEmployestWidget()
        ],
      ),
    );
  }
}

class _ListEmployestWidget extends StatefulWidget {
  const _ListEmployestWidget();

  @override
  State<_ListEmployestWidget> createState() => _ListEmployestWidgetState();
}

class _ListEmployestWidgetState extends State<_ListEmployestWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<EmployesProvider>(context, listen: false).getEmployes();
  }

  @override
  Widget build(BuildContext context) {
    var employes = Provider.of<EmployesProvider>(context).employes;
    var style = TextStyle(
      fontWeight: FontWeight.w600,
      color: getTheme(context).primary,
    );
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: PaginatedDataTable(
          columns: [
            DataColumn(label: Text('Código\nde empleado', style: style)),
            DataColumn(label: Text('Nombres', style: style)),
            DataColumn(label: Text('Apellidos', style: style)),
            DataColumn(label: Text('Fecha de\nnacimiento', style: style)),
            DataColumn(label: Text('Género', style: style)),
            DataColumn(label: Text('Tipo de\ncontratación', style: style)),
            DataColumn(label: Text('Sede\nasignada', style: style)),
            DataColumn(label: Text('Acciones', style: style)),
          ],
          source: EmployesTDS(employes, context),
        ),
      ),
    );
  }
}

class _FilterEmployesWidget extends StatelessWidget {
  const _FilterEmployesWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 500,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: getTheme(context).tertiary.withOpacity(0.5),
                  ),
                  labelText: " Búsqueda de empleado",
                  labelStyle: TextStyle(
                    color: getTheme(context).tertiary.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: getTheme(context).tertiary.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: getTheme(context).tertiary.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: getTheme(context).tertiary.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(
              width: 500,
              child: SelectCompaniesWidget(),
            ),
          ],
        ),
      ],
    );
  }
}

class SelectCompaniesWidget extends StatefulWidget {
  const SelectCompaniesWidget({
    super.key,
  });

  @override
  State<SelectCompaniesWidget> createState() => _SelectCompaniesWidgetState();
}

class _SelectCompaniesWidgetState extends State<SelectCompaniesWidget> {
  // Initial Selected Value
  String dropdownvalue = 'Selecciona una opción';

  // List of items in our dropdown menu
  var items = [
    'Selecciona una opción',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: 1,
      //     color: getTheme(context).tertiary.withOpacity(0.5),
      //   ),
      //   borderRadius: BorderRadius.circular(4),
      // ),
      child: DropdownButtonFormField(
        // Initial Value
        value: dropdownvalue,
        // underline: const SizedBox(),
        isExpanded: true,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),
        borderRadius: BorderRadius.circular(4),
        decoration: InputDecoration(
          labelText: "Lista de empleados por empresa",
          labelStyle: TextStyle(
            color: getTheme(context).tertiary.withOpacity(0.5),
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
              color: getTheme(context).tertiary.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: getTheme(context).tertiary.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items,
              style: TextStyle(
                color: getTheme(context).tertiary.withOpacity(0.5),
              ),
            ),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );
  }
}

class _BtnNewEmployedWidget extends StatelessWidget {
  const _BtnNewEmployedWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: () {
          print("object");
        },
        child: const Text(
          "Nuevo empleado",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}

class _TextParraWidget extends StatelessWidget {
  const _TextParraWidget();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      children: [
        const Text(
          "En esta sección podrás crear los empleados que estarán asignados por cada uno de los contratos que hayas creado en el módulo de ",
          style: TextStyle(
            color: textGray,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: () {
            NavigationService.replaceTo(Flurorouter.contractsRoute);
          },
          child: const Text(
            "Contratos",
            style: TextStyle(
              color: primary,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
