import 'package:flutter/material.dart';

import 'package:marcacion_admin/src/common/helpers/helpers.dart';

//TODO: ESTO NO DEBE QUEDAR ASI
import 'package:marcacion_admin/src/auth/view/login_view.dart';
import 'package:marcacion_admin/src/common/widgets/widgets.dart';

void main() {
  runApp(
    const AppProvider(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: setTheme(),
      home: const LoginView(),
    );
  }
}
