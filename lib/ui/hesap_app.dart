import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/konum/konum_cubit.dart';
import 'package:hesap/cubit/menu_arama/menu_arama_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/data/repository/auth/auth_repository_impl.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';
import 'package:hesap/data/repository/restoran/restoran_repository.dart';
import 'package:hesap/ui/screens/acilis/acilis_ekran.dart';
import 'package:hesap/ui/screens/ana/ana_ekran.dart';

// import 'package:hesap/ui/screens/ana/ana_ekran_semih.dart';
import 'package:hesap/ui/screens/giris_yap/giris_yap_screen.dart';
import 'package:hesap/ui/screens/pop_up/pop_ekran.dart';
import 'package:hesap/ui/screens/qr_code/qr_okuma_ekran.dart';
import 'package:hesap/ui/screens/restoranlar/restoranlar_screen.dart';
import 'package:hesap/ui/screens/uye_ol/uye_ol_ekran.dart';
import 'package:hesap/ui/theme/themes.dart';
import 'package:hesap/util/constants.dart';

import '../util/theme_manager.dart';

ThemeManager _themeManager = ThemeManager();

class HesapApp extends StatelessWidget {
  const HesapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepositoryImpl(),
          ),
        ),
        // BlocProvider(
        //   create: (context) => QRCubit(),
        // ),
        BlocProvider(
          create: (context) => DegisenEkranlarCubit(),
        ),
        BlocProvider(
          create: (context) => RestoranCubit(
            RestoranRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => KonumCubit(
            KonumRepository(),
          ),
        ),
        BlocProvider(create: (context) => MenuAramaCubit()),
        BlocProvider(create: (context) => ProfileCubit())
      ],
      child: MaterialApp(
        title: 'Hesap',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        initialRoute: ROUTE_RESTAURANTS,
        routes: {
          ROUTE_BASE: (context) => const AcilisEkran(),
          ROUTE_MAIN: (context) => const AnaEkran(),
          ROUTE_SIGN_IN: (context) => const GirisYapEkran(),
          ROUTE_SIGN_UP: (context) => const UyeOlEkran(),
          ROUTE_RESTAURANTS: (context) => const RestoranEkran(),
          ROUTE_QR_SCREEN: (context) => const QrOkumaEkran(),
          // ROUTE_POP_EKRAN: (context) => const PopUpEkran(text: text)
          // ROUTE_QR_SCREEN: (context) => const QRScannerScreen(),
        },
      ),
    );
  }
}
