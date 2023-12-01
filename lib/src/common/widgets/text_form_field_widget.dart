import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/const/styles.dart';

class TextFormFieldCustomWidget extends StatefulWidget {
  const TextFormFieldCustomWidget({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.none,
    this.cursorColor,
    this.onChange,
    this.onFieldSubmitted,
  });
  final Function? onChange;
  final Function(String)? onFieldSubmitted;
  final String label;
  final TextInputType keyboardType;
  final bool isPassword;
  final Color? cursorColor;
  final TextEditingController controller;
  @override
  State<TextFormFieldCustomWidget> createState() =>
      _TextFormFieldCustomWidgetState();
}

class _TextFormFieldCustomWidgetState extends State<TextFormFieldCustomWidget> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  bool showText = true;
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: widget.cursorColor ?? Colors.white,
      controller: widget.controller,
      obscureText: (widget.isPassword && showText),
      focusNode: _focus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? valor) {
        var data = (valor == null || valor.isEmpty)
            ? "Esta campo es requerido "
            : null;
        return data;
      },
      onChanged: (valor) {
        setState(() {
          isError = (valor.isEmpty);
        });
        if (widget.onChange != null) {
          widget.onChange!(valor);
        }
      },
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    showText = !showText;
                  });
                },
                child: showText
                    ? Icon(
                        Icons.visibility_off,
                        color: (_focus.hasFocus ||
                                widget.controller.text.isNotEmpty)
                            ? Colors.white
                            : primario.withOpacity(0.6),
                      )
                    : Icon(
                        Icons.visibility,
                        color: (_focus.hasFocus ||
                                widget.controller.text.isNotEmpty)
                            ? Colors.white
                            : primario.withOpacity(0.6),
                      ),
              )
            : null,
        labelText: widget.label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: error,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: error,
            width: 2,
          ),
        ),
        labelStyle: TextStyle(
          color: (_focus.hasFocus || widget.controller.text.isNotEmpty)
              ? isError
                  ? error
                  : Colors.white
              : primario.withOpacity(0.6),
        ),
      ),
    );
  }
}
