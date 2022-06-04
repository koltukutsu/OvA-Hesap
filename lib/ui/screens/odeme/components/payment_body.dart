import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/ui/screens/odeme/components/payment_card_list.dart';
import 'package:hesap/ui/screens/odeme/components/payment_item.dart';
import 'package:hesap/ui/screens/odeme/components/paymeny_agreement.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({Key? key, required this.orderList}) : super(key: key);

  final List<Order> orderList;

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  double sum = 0.0;

  @override
  void initState() {
    super.initState();
    context.read<CardCubit>().fetchSavedCards();

    widget.orderList.fold<double>(
      0.0,
      (previousValue, order) {
        sum = sum + order.product.price;
        return sum;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.orderList.length,
            itemBuilder: (context, index) {
              return PaymentItem(
                orderItem: widget.orderList[index],
              );
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Kart Bilgileri",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Yeni Kart Ekle",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.darkBackground,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          BlocBuilder<CardCubit, CardState>(
            builder: (context, state) {
              if (state is CardLoaded) {
                return PaymentCardList(
                  cardList: state.savedCards,
                );
              } else {
                return Container();
              }
            },
          ),
          const PaymentAgreement(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Toplam Tutar : $sum ₺",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: HesapButton(
                    filled: true,
                    label: "Onayla ve Bitir",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}