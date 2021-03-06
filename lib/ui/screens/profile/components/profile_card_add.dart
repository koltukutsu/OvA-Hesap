import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_error_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HesapAddCreditCard extends StatefulWidget {
  const HesapAddCreditCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HesapAddCreditCard();
  }
}

class _HesapAddCreditCard extends State<HesapAddCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // late final prefs;

  @override
  void initState() {
    Future<void> callSharedPreference() async {
      // shared preferences yuklendi
    }

    callSharedPreference();

    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Kart Ekle"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: null,
          color: AppColors.white,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                labelCardHolder: 'KART SAHiBi',
                isHolderNameVisible: true,
                cardBgColor: AppColors.primary,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        dateValidationMessage: "L??tfen ge??erli bir tarih girin",
                        numberValidationMessage:
                            "L??tfen ge??erli bir kart numaras?? girin",
                        cvvValidationMessage:
                            "L??tfen ge??erli bir CVV numaras?? girin",
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.black,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Kart Numaras??',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Son Tarih',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Kart Sahibi',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HesapButtonAnimated(
                        label: "Kart??n?? Ekle",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            sharedPreferenceAddCard(
                                cardNumber: cardNumber,
                                expiryDate: expiryDate,
                                cardHolderName: cardHolderName,
                                cvvCode: cvvCode);
                          } else {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                errorSnackbar("Kart Bilgilerin Eksik"),
                              );
                          }
                        },
                        widthRatio: 0.35,
                        filled: true,
                        enabled: ((cardNumber.length != 0) &&
                                    (expiryDate.length != 0) &&
                                    (cvvCode.length != 0) &&
                                    (cardHolderName.length != 0)) ==
                                true
                            ? true
                            : false,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Future<void> sharedPreferenceAddCard(
      {required String cardNumber,
      required String expiryDate,
      required String cardHolderName,
      required String cvvCode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? kayitliKullaniciKartlari =
        prefs.getStringList('kullanici_kartlar');

    if (kayitliKullaniciKartlari == null) {
      // await prefs.setStringList('kullanici_kartlar', <String>[]);
      // List<String>? kayit_kullanici_kartlar =
      prefs.getStringList('kullanici_kartlar');
      kayitliKullaniciKartlari = [];
      final String kullaniciKart =
          "$cardNumber-$cardHolderName-$expiryDate-$cvvCode";
      kayitliKullaniciKartlari.add(kullaniciKart);

      await prefs.setStringList('kullanici_kartlar', kayitliKullaniciKartlari);
    } else {
      final String kullaniciKart =
          "$cardNumber-$cardHolderName-$expiryDate-$cvvCode";
      if (kayitliKullaniciKartlari.indexOf(kullaniciKart) != -1) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            errorSnackbar("Bu Kart Daha ??nce Girilmi??"),
          );
      } else {
        kayitliKullaniciKartlari.add(kullaniciKart);

        await prefs.setStringList(
            'kullanici_kartlar', kayitliKullaniciKartlari);
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            correctSnackbar(
                "Kart??n eklendi. Eklenen kart??n?? Kartlar??m k??sm??ndan g??rebilirsin"),
          );
        context.read<CardCubit>().fetchSavedCardFromSharedPreferences();

      }
    }

    debugPrint(kayitliKullaniciKartlari.toString());
  }
}
