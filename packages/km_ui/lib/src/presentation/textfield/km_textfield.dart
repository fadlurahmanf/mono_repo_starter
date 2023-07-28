// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:km_ui/km_ui.dart';
import 'package:km_ui/src/presentation/textfield/km_textfield_bloc.dart';
import 'package:sizer/sizer.dart';

class KmTextFieldAction {
  VoidCallback? onTapIcon;
  Widget Function(BuildContext)? iconChild;

  KmTextFieldAction({this.iconChild});
}

class KmTextField extends StatelessWidget {
  TextEditingController controller;
  void Function(String)? onChange;

  String? label;
  String? hint;
  String? error;

  KmTextFieldAction? drawableEnd;

  KmTextField({
    required this.controller,
    this.onChange,
    this.label,
    this.hint,
    this.error,
    this.drawableEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KmTextFieldBloc(),
      child: _KmTextFieldLayout(
        controller: controller,
        onChange: onChange,
        label: label,
        hint: hint,
        error: error,
        drawableEnd: drawableEnd,
        key: key,
      ),
    );
  }
}

class _KmTextFieldLayout extends StatefulWidget {
  TextEditingController controller;
  void Function(String)? onChange;

  String? label;
  String? hint;
  String? error;

  KmTextFieldAction? drawableEnd;

  _KmTextFieldLayout({
    required this.controller,
    this.onChange,
    this.label,
    this.hint,
    this.error,
    this.drawableEnd,
    super.key,
  });

  @override
  State<_KmTextFieldLayout> createState() => _KmTextFieldLayoutState();
}

class _KmTextFieldLayoutState extends State<_KmTextFieldLayout> {
  KmTextFieldBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);

    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        _bloc?.add(KmTextFieldEvent.typing(text: widget.controller.text));
      }
    });

    if (widget.error != null) {
      _bloc?.add(KmTextFieldEvent.setError(error: widget.error));
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant _KmTextFieldLayout oldWidget) {
    if (widget.error != oldWidget.error) {
      _bloc?.add(KmTextFieldEvent.setError(error: widget.error));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KmTextFieldBloc, KmTextFieldState>(builder: (context, state) {
      final color = state.error != null ? Colors.red : KmColor.green;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: state.showLabel == true,
                  child: SizedBox(
                    height: 17.sp,
                    child: Text(
                      widget.label ?? widget.hint ?? '-',
                      style: KmTextStyle.labelTextField(color: color),
                    ),
                  ),
                ),
                Container(
                  padding: state.showLabel == true ? EdgeInsets.zero : EdgeInsets.only(bottom: 5.sp, top: 5.sp),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: widget.controller,
                        onChanged: widget.onChange,
                        decoration: InputDecoration(
                            hintText: widget.hint ?? "-",
                            hintStyle: KmTextStyle.hintTextField(),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero),
                      )),
                      // Visibility(
                      //   visible: widget.drawableEnd != null,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.error != null,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Text(
                widget.error ?? '',
                style: KmTextStyle.errorTextField(),
              ),
            ),
          ),
        ],
      );
    });
  }

// Widget _iconWidget(BuildContext context) {
//   return widget.drawableEnd?.iconData != null ? GestureDetector(
//     onTap: widget.drawableEnd?.onTapIconData,
//     child: Icon(icon),
//   );
// }
}
