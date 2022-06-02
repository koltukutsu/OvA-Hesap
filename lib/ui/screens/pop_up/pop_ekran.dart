// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';

// import 'package:flutter/services.dart';
import 'package:hesap/ui/widgets/hesap_button_not_flexible.dart';
import 'package:hesap/ui/screens/pop_up/components/hesap_middle_side2.dart';

// component
import 'package:hesap/ui/screens/common_screen_sections/hesap_up_side.dart';
import 'package:hesap/util/constants.dart';

class PopUpEkran extends StatefulWidget {
  const PopUpEkran({Key? key, required this.text}) : super(key: key);
  final String text;

  // final String secondText;

  @override
  State<PopUpEkran> createState() => _PopUpEkran();
}

class _PopUpEkran extends State<PopUpEkran> {
  void _startingFunction() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _startingFunction());
  }

  final Map data = {
    "Masa Ismi": "Masa 42",
    "kisiler": [
      {
        "ismi": "Merve",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Zeyney",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Semih",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Erdem",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Emine",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
          builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: CustomScrollView(
                slivers: [
                  const SliverUpSide(),
                  HesapMiddleSide2(data: data), // HesapMiddleSide(data: data),
                ],
              ),
            ),
            const MasayaOturun(),
            const Iptal(),
          ],
        );
      }),
    );
  }
}

class MasayaOturun extends StatelessWidget {
  const MasayaOturun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 300,
      child: HesapButtonNotFlexible(
        label: 'Masaya Oturun',
        filled: true,
        textSize: 24,
        onPressed: () {
          // Navigator.of(context).pop();
          //   Navigator.pop(context, 1);
          BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
          Navigator.of(context).pushNamed(ROUTE_MAIN);
        },
      ),
    );
  }
}

class Iptal extends StatelessWidget {
  const Iptal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HesapButton(
      label: 'İptal',
      filled: false,
      onPressed: () {
        // Navigator.of(context).pop(0);
        // BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(0); //TODO: 1. sayfayla ilgili olan ve restoran kismina donme
        BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
        Navigator.of(context).popUntil(ModalRoute.withName(ROUTE_RESTAURANTS));
      },
    );
  }
}
