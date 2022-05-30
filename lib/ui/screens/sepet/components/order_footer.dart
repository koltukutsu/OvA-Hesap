import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/ui/theme/colors.dart';

class SepetFooter extends StatefulWidget {
  const SepetFooter({
    Key? key,
  }) : super(key: key);

  @override
  State<SepetFooter> createState() => _SepetFooterState();
}

class _SepetFooterState extends State<SepetFooter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Column(
            children: [
              SvgPicture.asset("assets/images/sepet_divider.svg",
                  width: MediaQuery.of(context).size.width),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Not Ekle',
                    labelStyle: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 16,
                        color: AppColors.gray),
                  ),
                ),
              ),
              SvgPicture.asset("assets/images/sepet_divider.svg",
                  width: MediaQuery.of(context).size.width),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 7, top: 14, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Toplam Tutar:",
                      style: TextStyle(fontSize: 20, fontFamily: 'ubuntu'),
                    ),
                    SizedBox(
                      height: 48,
                      width: 84,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: AppColors.amountBox,
                        ),
                        child: const Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "45,00",
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                      width: 84,
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: alertDialog eklenecek, odeme tamamlandi
                        },
                        child: const Text(
                          "ÖDE",
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: AppColors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
