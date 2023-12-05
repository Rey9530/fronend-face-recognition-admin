import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';

class EmployesView extends StatelessWidget {
  const EmployesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BreadCrumWidget(
            title: 'Empleados',
          ),
          Text(
            "EmployesView",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
