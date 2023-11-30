import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/auth/viewmodel/provider_auth.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: child,
    );
  }
}
