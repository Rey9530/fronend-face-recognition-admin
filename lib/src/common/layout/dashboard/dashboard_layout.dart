import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context).primary,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const _SideBarMenuWidget(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideBarMenuWidget extends StatefulWidget {
  const _SideBarMenuWidget();

  @override
  State<_SideBarMenuWidget> createState() => _SideBarMenuWidgetState();
}

class _SideBarMenuWidgetState extends State<_SideBarMenuWidget> {
  String menu = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 25,
            left: 0,
            bottom: 100,
          ),
          child: Image.asset(
            "assets/images/icon.png",
          ),
        ),
        ItemsMenuWidget(
          active: menu == 'dashboard',
          title: 'Dashboard',
          iconName: 'dashboard',
          onPress: () {
            setState(() {
              menu = 'dashboard';
            });
          },
        ),
        ItemsMenuWidget(
          active: menu == 'company',
          title: 'empresas',
          iconName: 'company',
          onPress: () {
            setState(() {
              menu = 'company';
            });
          },
        ),
        ItemsMenuWidget(
          active: menu == 'employes',
          title: 'Empleados',
          iconName: 'employes',
          onPress: () {
            setState(() {
              menu = 'employes';
            });
          },
        ),
        ItemsMenuWidget(
          active: menu == 'proyect',
          title: 'Contratos',
          iconName: 'proyect',
          onPress: () {
            setState(() {
              menu = 'proyect';
            });
          },
        ),
        ItemsMenuWidget(
          active: menu == 'report',
          title: 'Reportes',
          iconName: 'report',
          onPress: () {
            setState(() {
              menu = 'report';
            });
          },
        ),
        ItemsMenuWidget(
          active: menu == 'users',
          title: 'Usuario',
          iconName: 'users',
          onPress: () {
            setState(() {
              menu = 'users';
            });
          },
        ),
        const Spacer(),
        const VersionWidget(),
        const SizedBox(height: 60)
      ],
    );
  }
}

class VersionWidget extends StatelessWidget {
  const VersionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Versión\n1.0\nQ1-2024",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ItemsMenuWidget extends StatelessWidget {
  const ItemsMenuWidget({
    super.key,
    required this.active,
    required this.title,
    required this.iconName,
    required this.onPress,
  });
  final bool active;
  final String title;
  final String iconName;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: active
          ? Container(
              width: 168,
              height: 95,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/${iconName}_primary.png"),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: getTheme(context).primary,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: 168,
              height: 95,
              decoration: BoxDecoration(
                color: getTheme(context).primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/${iconName}_white.png"),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
