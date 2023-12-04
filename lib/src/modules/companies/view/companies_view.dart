import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';

class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BreadCrumWidget(
          title: 'Empresas',
        ),
        Text(
          "CompaniesView",
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
