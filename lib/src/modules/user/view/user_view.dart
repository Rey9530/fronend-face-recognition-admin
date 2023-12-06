import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/const/const.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BreadCrumWidget(
            showLogout: false,
            title: 'Usuario',
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: BigUserWidget(),
          ),
          UserInfoWidget(),
        ],
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 740,
      padding: const EdgeInsets.only(top: 100),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          ItemUserInfoWidget(
            title: 'Nombres',
            subtitle: LocalStorage.prefs.getString('nombres') ?? "",
          ),
          ItemUserInfoWidget(
            title: 'Apellido',
            subtitle: LocalStorage.prefs.getString('apellidos') ?? "",
          ),
          ItemUserInfoWidget(
            title: 'Código de empleado:',
            subtitle: LocalStorage.prefs.getString('codigo') ?? "",
          ),
          const ItemUserInfoWidget(
            title: 'Contraseña',
            subtitle: "**********",
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: 300,
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 300,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                print("objectdsds");
              },
              child: const Text(
                "Cambiar contraseña",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: neutral,
                  decorationColor: neutral,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemUserInfoWidget extends StatelessWidget {
  const ItemUserInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: userCardBackground,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: getTheme(context).primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            subtitle,
            style: TextStyle(
              color: getTheme(context).primary,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
