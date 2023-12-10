import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/models/dropdown_buttom_data_model.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';
import 'package:marcacion_admin/src/modules/contract/viewmodel/contracts_provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SchedulesContractsView extends StatelessWidget {
  const SchedulesContractsView({super.key, this.uuid});
  final String? uuid;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContractsProvider>(context, listen: false);
    return FutureBuilder(
      future: provider.loadToSchedules(uuid),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SchedulesBodyWidget();
      },
    );
  }
}

class SchedulesBodyWidget extends StatelessWidget {
  const SchedulesBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContractsProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          BreadCrumWidget(
            title:
                'Contratos / ${provider.contract?.ctrNombre ?? ''} / Horarios',
          ),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: GoBackWidget(),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Completa los campos. Al terminar da clic en el botón “Guardar”.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 50),
          const _FormewContractsWidget()
        ],
      ),
    );
  }
}

class _FormewContractsWidget extends StatelessWidget {
  const _FormewContractsWidget();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContractsProvider>(context);
    return Form(
      key: provider.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 1100,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 400,
                  child: TextFormFieldCustomWidget(
                    isDark: true,
                    label: "Nombre del contrato",
                    hinText: 'Escribe el nombre para tu contrato',
                    controller: provider.contractName,
                    onChange: (valor) {
                      // provider.validarInput();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: 200,
                  child: TextFormFieldCustomWidget(
                    isDark: true,
                    label: "Número de contrato",
                    hinText: 'Escribe el número de contrato',
                    controller: provider.contractsNumber,
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
                    inputFormatters: [
                      MaskTextInputFormatter(
                        mask: '##/##/####',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy,
                      ),
                    ],
                    isDark: true,
                    label: "Fecha de inicio",
                    hinText: '00/00/0000',
                    controller: provider.startDate,
                    onChange: (String valor) async {},
                    suffixIcon: InkWell(
                      onTap: () async {
                        var data = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now().add(
                            const Duration(days: -6570),
                          ),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          locale: const Locale('es', 'ES'),
                        );
                        if (data != null) {}
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
                    inputFormatters: [
                      MaskTextInputFormatter(
                        mask: '##/##/####',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy,
                      ),
                    ],
                    isDark: true,
                    label: "Fecha de fin",
                    hinText: '00/00/0000',
                    controller: provider.endDate,
                    onChange: (String valor) async {},
                    suffixIcon: InkWell(
                      onTap: () async {
                        var data = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now().add(
                            const Duration(days: -6570),
                          ),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          locale: const Locale('es', 'ES'),
                        );
                        if (data != null) {}
                      },
                      child: Image.asset("assets/icons/calendar_primary.png"),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 350,
                  child: SelectCompaniesWidget(
                    controller: provider.company,
                    title: 'Empresa',
                    onChange: (val) {},
                    selected: DropdownButtonData(
                      id: provider.company.text,
                      title: provider.company.text,
                    ),
                    items: [
                      ...provider.companies.map(
                        (e) => DropdownButtonData(
                          id: e.eprCodigo,
                          title: e.eprNombre,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: 170,
                  child: TextFormFieldCustomWidget(
                    isDark: true,
                    label: "Horas extras",
                    hinText: 'Ingrese una cantidad',
                    controller: provider.extraHours,
                    onChange: (valor) {
                      // provider.validarInput();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: 160,
                  child: const SwitchListTileExample(),
                ),
                if (provider.isExtendable)
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    width: 150,
                    child: TextFormFieldCustomWidget(
                      isDark: true,
                      label: "Inicio de prórroga",
                      hinText: '00/00/0000',
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: '##/##/####',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy,
                        ),
                      ],
                      controller: provider.startDateExtendable,
                      onChange: (valor) async {},
                      suffixIcon: InkWell(
                        onTap: () async {
                          var data = await showDatePicker(
                            context: context,
                            firstDate: DateTime(DateTime.now().year),
                            lastDate: DateTime(DateTime.now().year, 12, 31),
                            // barrierDismissible: false,
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            locale: const Locale('es', 'ES'),
                          );
                          if (data != null) {
                            // String onlydate =
                            //     DateFormat("dd/MM/yyyy").format(data);
                            // provider.ContractsDateStart.text = onlydate;
                          }
                        },
                        child: Image.asset("assets/icons/calendar_primary.png"),
                      ),
                    ),
                  ),
                if (provider.isExtendable)
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    width: 150,
                    child: TextFormFieldCustomWidget(
                      isDark: true,
                      label: "Fin de prórroga",
                      hinText: '00/00/0000',
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: '##/##/####',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy,
                        ),
                      ],
                      controller: provider.endDateExtendable,
                      onChange: (valor) async {},
                      suffixIcon: InkWell(
                        onTap: () async {
                          var data = await showDatePicker(
                            context: context,
                            firstDate: DateTime(DateTime.now().year),
                            lastDate: DateTime(DateTime.now().year, 12, 31),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            locale: const Locale('es', 'ES'),
                          );
                          if (data != null) {
                            // String onlydate =
                            //     DateFormat("dd/MM/yyyy").format(data);
                            // provider.ContractsDateStart.text = onlydate;
                          }
                        },
                        child: Image.asset("assets/icons/calendar_primary.png"),
                      ),
                    ),
                  ),
                if (!provider.isExtendable)
                  const SizedBox(
                    width: 340,
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: BtnWidget(
                    width: 200,
                    height: 60,
                    loading: provider.loading,
                    title: "Guardar",
                    onPress: () async {
                      // provider.saveContract();
                      if (provider.formKey.currentState?.validate() ?? false) {
                        await provider.saveContract();
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({super.key});

  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContractsProvider>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            activeColor: Colors.white,
            inactiveThumbColor: getTheme(context).primary,
            inactiveTrackColor: Colors.white,
            activeThumbImage: const AssetImage("assets/icons/check_24px.png"),
            inactiveThumbImage: const AssetImage("assets/icons/icon_close.png"),
            activeTrackColor: getTheme(context).primary,
            value: provider.isExtendable,
            onChanged: (bool value) {
              setState(() {
                provider.changeIsExtendable(value);
              });
            },
          ),
          const SizedBox(width: 10),
          Text(
            "Prorrogable",
            style: TextStyle(
              color: getTheme(context).primary,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
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
