import 'package:delivery_app/src/ui/global_widgets/custom_form.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final Widget? prefixIcon;
  final String? Function(String)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? labelText;

  const InputText({
    Key? key,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
  }) : super(key: key);

  @override
  State<InputText> createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String? _errorText = '';
  late bool _obscureText;
  CustomFormState? _formState;

  String? get errorText => _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formState = CustomForm.of(context);
      _formState?.register(this);
    });
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _errorText = widget.validator!(text);
      setState(() {});
    }

    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  void _onVisibleChanged() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void deactivate() {
    _formState?.remove(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validate,
      onSubmitted: widget.onSubmitted,
      obscureText: _obscureText,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? CupertinoButton(
                minSize: 25,
                padding: const EdgeInsets.all(10),
                onPressed: _onVisibleChanged,
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _obscureText ? Colors.grey : null,
                ),
              )
            : Icon(
                Icons.check_circle,
                color: _errorText == null ? primaryColor : Colors.grey,
              ),
      ),
    );
  }
}
