import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/services/state/state_handler_bloc.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final String? title;
  final ValueChanged<bool> onValueChange;
  const CustomCheckbox({
    super.key,
    required this.initialValue,
    this.title,
    required this.onValueChange,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  StateHandlerBloc stateHandlerBloc = StateHandlerBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      initialData: widget.initialValue,
      stream: stateHandlerBloc.stateStream,
      builder: (c, snapshot) {
        return Row(
          children: [
            Checkbox(
              shape: const CircleBorder(),
              value: snapshot.data,
              visualDensity: const VisualDensity(horizontal: -4),
              onChanged: (v) {
                widget.onValueChange(v!);
                stateHandlerBloc.storeData(data: v);
              },
              checkColor: AppColors.kWhite,
              activeColor: AppColors.kPrimary,
            ),
            if (widget.title != null) ...{
              sizedBox8(),
              CustomText(text: widget.title!)
            }
          ],
        );
      },
    );
  }
}

// Widget myCheckBox(
//     {required bool initialValue,
//     String? title,
//     required StateHandlerBloc bloc,
//     required ValueChanged<bool> onValueChange}) {
//   return 
// }