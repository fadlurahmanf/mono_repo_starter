import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:km_shared/km_shared.dart';
import 'package:km_ui/km_ui.dart';
import 'package:km_ui/src/presentation/bottomsheet/loading_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoadingBottomSheet extends StatelessWidget {
  const LoadingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingBloc(),
      child: _LoadingBottomSheetLayout(
        key: key,
      ),
    );
  }
}

class _LoadingBottomSheetLayout extends StatefulWidget {
  const _LoadingBottomSheetLayout({super.key});

  @override
  State<_LoadingBottomSheetLayout> createState() => _LoadingBottomSheetLayoutState();
}

class _LoadingBottomSheetLayoutState extends State<_LoadingBottomSheetLayout> {
  LoadingBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<LoadingBloc>(context);
    _setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.h, left: 15.w, right: 15.w, top: 3.h),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp))),
      child: BlocBuilder<LoadingBloc, LoadingState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 10,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: Colors.grey.shade300
                ),
              ),
              Container(
                  child: Lottie.asset(KmAssetConstant.waveLoading)),
              Text(
                state.showLoadingInAWhile == true ? KmConstant.loadingInAWhile.tr : KmConstant.loading.tr,
                style: KmTextStyle.style14(),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  void _setTimer() {
    final timer = Timer(const Duration(seconds: 5), () {
      _bloc?.add(const LoadingEvent.setLoadingInAWhile());
    });
    _bloc?.add(LoadingEvent.setTimer(timer));
  }
}
