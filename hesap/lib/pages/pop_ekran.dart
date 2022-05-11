// necessary
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesap/components/elements/buton.dart';
import 'package:hesap/components/screen_sections/hesap_middle_side2.dart';
// component
import 'package:hesap/components/screen_sections/hesap_up_side.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) => _startingFunction());
  }

  final Map data = {
    "Masa Ismi": "Flutter Kafe",
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
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      //   backgroundColor: AppColors.primary,
      //   elevation: 1,
      // ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HesapUpSide(
            mekanIsmi: widget.text,
            secondText: "Masa 24",
          ),
          HesapMiddleSide2(data: data),

          SizedBox(
            height: 50,
            width: 300,
            child: Buton(
              label: 'Masaya Oturun',
              filled: true,
              textSize: 24,
              onPressed: () {
                // Navigator.of(context).pop();
                  Navigator.pop(context, 1);
              },
            ),
          ),
          SizedBox(
            height: 47,
            width: 298,
            child: Buton(
              label: 'İptal',
              filled: true,
              textSize: 24,
              onPressed: () {
                Navigator.of(context).pop(0);
              },
            ),
          ),
          // HesapMiddleSide(data: data),
        ],
      )),
    );
  }
}
