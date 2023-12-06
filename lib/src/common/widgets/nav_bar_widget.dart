import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/const/const.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/modules/auth/viewmodel/auth_provider.dart';
import 'package:provider/provider.dart';

class BreadCrumWidget extends StatelessWidget {
  const BreadCrumWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: getTheme(context).primary,
          ),
        ),
        const UserWidget(),
      ],
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerAuth = Provider.of<AuthProvider>(context, listen: false);
    return Container(
      width: 220,
      height: 55,
      decoration: BoxDecoration(
        color: userWidgetBackground,
        borderRadius: BorderRadius.circular(20000),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Image.asset("assets/icons/user_iconHeader.png"),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalStorage.prefs.getString('nombres') ?? '',
                style: TextStyle(
                  color: getTheme(context).primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                LocalStorage.prefs.getString('codigo') ?? '',
                style: TextStyle(
                  color: getTheme(context).primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              providerAuth.logout();
            },
            child: Image.asset("assets/icons/logout.png"),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
