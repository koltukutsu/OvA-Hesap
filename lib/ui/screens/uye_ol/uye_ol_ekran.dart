import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/ui/screens/uye_ol/components/uye_ol_dogrulama_pencere.dart';
import '../../../cubit/auth/auth_cubit.dart';
import '../../widgets/hesap_error_snack_bar.dart';
import 'components/uye_ol_app_bar.dart';
import 'components/uye_ol_body.dart';

class UyeOlEkran extends StatefulWidget {
  const UyeOlEkran({Key? key}) : super(key: key);

  @override
  State<UyeOlEkran> createState() => _UyeOlEkranState();
}

class _UyeOlEkranState extends State<UyeOlEkran> {
  String username = "";
  String email = "";
  String password = "";
  String phone = "";
  String passwordAgain = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackbar(state.errorMessage));
        } else if (state is AuthLoggedIn) {
          showSignUpVerificationDialog(
            () {
              Navigator.pop(context);
            },
          );
        }
      },
      child: Scaffold(
        appBar: UyeOlAppBar(
          onClosed: () {
            Navigator.pop(context);
          },
        ),
        body: UyeOlBody(
          setUsername: (value) {
            username = value;
          },
          setEmail: (value) {
            email = value;
          },
          setPhone: (value) {
            phone = value;
          },
          setPassword: (value) {
            password = value;
          },
          setPasswordAgain: (value) {
            passwordAgain = value;
          },
          confirm: () {
            context.read<AuthCubit>().signUp(
                  username: username,
                  email: email,
                  phone: phone,
                  password: password,
                  passwordAgain: passwordAgain,
                );
          },
        ),
      ),
    );
  }

  Future<void> showSignUpVerificationDialog(VoidCallback confirm) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return UyeOlDogrulamaPencere(
          email: email,
          confirm: confirm,
        );
      },
    );
  }
}