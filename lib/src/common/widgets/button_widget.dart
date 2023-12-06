import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/const/const.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    super.key,
    this.width = double.infinity,
    this.height = 50,
    required this.title,
    required this.onPress,
    this.disable = false,
    this.loading = false,
  });
  final double? width;
  final bool disable;
  final bool loading;

  final String title;
  final double height;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: disable ? primario : primary,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        onPressed: () {
          onPress();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!loading)
              Text(
                title,
                style: TextStyle(
                  color: disable ? primarioText : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (loading) ...[
              const SizedBox(width: 10),
              const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
