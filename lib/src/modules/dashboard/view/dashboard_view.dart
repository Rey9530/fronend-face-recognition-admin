import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BreadCrumWidget(
          title: 'Dashboar',
        ),
        Text(
          "Dashboar",
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
