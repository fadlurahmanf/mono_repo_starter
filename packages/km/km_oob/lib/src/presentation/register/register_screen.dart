import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:km_oob/src/presentation/register/register_bloc.dart';
import 'package:km_ui/km_ui.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc()),
      ],
      child: _RegisterLayout(
        key: key,
      ),
    );
  }
}

class _RegisterLayout extends StatefulWidget {
  const _RegisterLayout({super.key});

  @override
  State<_RegisterLayout> createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<_RegisterLayout> {
  RegisterBloc? _bloc;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            final registerState = state.postingRegisterState;
            if (registerState is PostingRegisterLoading) {
              context.showBottomsheet(const LoadingBottomSheet());
            } else if (registerState is PostingRegisterSuccess) {
              context.dismissBottomsheet();
            } else if (registerState is PostingRegisterFailed) {
              context.dismissBottomsheet();
            }
          },
        )
      ],
      child: KmBaseVibrance(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const KmLogo(),
              SizedBox(
                height: (0.5).h,
              ),
              Text(
                'Hello!',
                style: KmTextStyle.title(),
              ),
              SizedBox(
                height: (0.5).h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Text('Welcome! Find jobs that suit you here, let’s get to work!',
                  style: KmTextStyle.style14(
                    height: 1.2,
                    color: Colors.grey
                  ), textAlign: TextAlign.center,
                ),
              ),
              Image.asset(KmAssetConstant.signup1, height: (20).h),
              _formLayout(),
              SizedBox(
                height: 3.h,
              ),
              KmFilledButton.text(
                text: "Register",
                onTap: () async {
                  context.showBottomsheet(const LoadingBottomSheet());
                  // _bloc?.add(const RegisterEvent.register());
                },
              ),
              SizedBox(
                height: 10.sp,
              ),
              const KmFooter(),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formLayout() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, regState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.sp),
            child: KmTextField(
              controller: fullNameController,
              error: regState.eFullName,
              hint: "Nama Lengkap",
              onChange: (value) {
                _bloc?.add(RegisterEvent.fillFullName(fullName: value));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.sp),
            child: KmTextField(
              controller: emailController,
              error: regState.eEmail,
              hint: "Email",
              onChange: (value) {
                _bloc?.add(RegisterEvent.fillEmail(email: value));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.sp),
            child: KmTextField(
              controller: passwordController,
              error: regState.ePassword,
              hint: "Password",
              onChange: (value) {
                _bloc?.add(RegisterEvent.fillPassword(password: value));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.sp),
            child: KmTextField(
              controller: confPasswordController,
              error: regState.eConfPassword,
              hint: "Konfirmasi Password",
              textInputAction: TextInputAction.done,
              onChange: (value) {
                _bloc?.add(RegisterEvent.fillConfPassword(password: value));
              },
            ),
          ),
        ],
      );
    });
  }
}
