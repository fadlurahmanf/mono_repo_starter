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
  RegisterBloc? registerBloc;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    registerBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const KmLogo(),
                Text(
                  'Hello!',
                  style: KmTextStyle.title(),
                ),
                _formLayout(),
                KmFilledButton.text(
                    text: "Register",
                ),
                const KmFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formLayout() {
    return Expanded(
      child: BlocBuilder<RegisterBloc, RegisterState>(builder: (context, regState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.sp),
              child: KmTextField(
                controller: fullNameController,
                error: regState.eEmail,
                hint: "Nama Lengkap",
                onChange: (value) {
                  registerBloc?.add(RegisterEvent.fillFullName(fullName: value));
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
                  registerBloc?.add(RegisterEvent.fillEmail(email: value));
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
                  registerBloc?.add(RegisterEvent.fillPassword(password: value));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.sp),
              child: KmTextField(
                controller: confPasswordController,
                error: regState.eConfPassword,
                hint: "Konfirmasi Password",
                onChange: (value) {
                  registerBloc?.add(RegisterEvent.fillConfPassword(password: value));
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
