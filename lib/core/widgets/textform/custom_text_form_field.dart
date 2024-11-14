import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/services/state/state_handler_bloc.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

enum InputType { text, email, number, phone, password }

class CustomTextFormField extends StatefulWidget {
  final InputType? inputType;
  final int? maxLines;
  final bool readOnly;
  final bool? isLoading;
  final IconData? suffixIcon;
  final Function? onTap;
  final String title;
  final String initialValue;
  final TextEditingController textEditingController;
  final String errorMessage;
  final GlobalKey<FormState>? formKey;
  final ValueChanged<String>? onValueChange;
  final Function({required String v})? customValidation;
  const CustomTextFormField({
    super.key,
    this.isLoading,
    required this.readOnly,
    this.onTap,
    required this.textEditingController,
    required this.title,
    required this.initialValue,
    required this.errorMessage,
    required this.formKey,
    this.customValidation,
    this.onValueChange,
    this.suffixIcon,
    this.inputType,
    this.maxLines,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  StateHandlerBloc passwordBloc = StateHandlerBloc();

  @override
  void dispose() {
    if (widget.formKey != null && widget.formKey!.currentState != null) {
      widget.formKey!.currentState!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData:
          widget.inputType != null && widget.inputType == InputType.password,
      stream: passwordBloc.stateStream,
      builder: (cc, ss) {
        bool hidePassword = ss.data;
        return Form(
          key: widget.formKey,
          child: TextFormField(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
            obscureText: hidePassword,
            maxLength: 256,
            readOnly: widget.readOnly,
            controller: widget.textEditingController,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            maxLines: widget.maxLines ?? 1,
            cursorColor: AppColors.kPrimary,
            keyboardType: getInputType(),
            onChanged: (String value) {
              if (widget.formKey != null) {
                widget.formKey!.currentState!.validate();
              }
              if (widget.onValueChange != null) {
                widget.onValueChange!(value);
              }
            },
            decoration: InputDecoration(
              label: CustomText(text: widget.title),
              hintText:
                  widget.initialValue.isNotEmpty ? widget.initialValue : '',
              counterText: "",
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 12.0,
              ),
              errorStyle: TextStyle(
                fontSize: 12.0,
                color: AppColors.kRed,
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: widget.inputType == InputType.password
                  ? GestureDetector(
                      onTap: () {
                        passwordBloc.storeData(data: !hidePassword);
                      },
                      child: Icon(
                        hidePassword ? Icons.visibility : Icons.visibility_off,
                        size: 18,
                        color: AppColors.kBlack,
                      ),
                    )
                  : widget.isLoading == true
                      ? Container(
                          width: 15.0,
                          height: 15.0,
                          margin:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child:
                              const CircularProgressIndicator(strokeWidth: 2))
                      : widget.suffixIcon == null
                          ? null
                          : Icon(
                              widget.suffixIcon,
                              size: 18,
                              color: AppColors.kBlack,
                            ),
              errorMaxLines: 3,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              filled: true,
              fillColor: AppColors.kWhite,
              enabledBorder: getBorder(),
              focusedBorder: getBorder(),
              border: getBorder(),
              errorBorder: getBorder(isError: true),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return widget.errorMessage;
              } else if (widget.inputType == InputType.email &&
                  !RegExp(r'^[a-zA-Z0-9.@-]+$').hasMatch(v)) {
                return '* Only letters (a-z), numbers (0-9), and periods(.) are allowed.';
              } else if (widget.customValidation != null) {
                return widget.customValidation!(v: v);
              }
              return null;
            },
          ),
        );
      },
    );
  }

  TextInputType getInputType() {
    switch (widget.inputType) {
      case InputType.text:
        return TextInputType.text;
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.number:
        return TextInputType.number;
      case InputType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  OutlineInputBorder getBorder({bool? isError}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(
        width: isError != null ? 2 : 1,
        color: isError != null ? AppColors.kRed : AppColors.kLightGrey,
      ),
      gapPadding: 2,
    );
  }
}
