import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/internet_baglantisi/internet_cubit.dart';
import 'package:hesap/ui/screens/ana/ana_ekran.dart';
import 'package:hesap/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:hesap/ui/screens/profile/profile_screen.dart';
import 'package:hesap/ui/screens/restoranlar/restoranlar_screen.dart';
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_error_snack_bar.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'components/loading_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context_2, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context_2)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              errorSnackbar("Giriş Yapmadınız"),
            );
        }
        // {
        //   context.read<InternetCubit>().initialInternetControl();
        //   print(context.read<InternetCubit>().getInternetCondition);
        //   if (context.read<InternetCubit>().getInternetCondition == true) {
        //     ScaffoldMessenger.of(context)
        //       ..removeCurrentSnackBar()
        //       ..showSnackBar(
        //         correctSnackbar("Internete Baglisiniz"),
        //       );
        //   } else if (context.read<InternetCubit>().getInternetCondition ==
        //       false) {
        //     ScaffoldMessenger.of(context)
        //       ..removeCurrentSnackBar()
        //       ..showSnackBar(
        //         errorSnackbar("Internet Baglantiniz Yok"),
        //       );
        //   }
        // }
      },
      builder: (context, state) {
        if (state is AuthSignInSuccessful) {
          return const RestoranEkran();
          //return const QRScannerScreen();
        } else if (state is AuthNotSignedIn) {
          return const OnBoardingScreen();
        }
        return const LoadingScreen();
      },
    );
  }
}
