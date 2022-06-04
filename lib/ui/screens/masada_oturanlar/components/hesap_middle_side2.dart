// necessary
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';

// components
// import 'package:hesap/ui/widgets/hesap_image_card.dart';
import 'package:hesap/ui/widgets/hesap_text_card.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class HesapMiddleSide2 extends StatefulWidget {
  const HesapMiddleSide2({
    Key? key,
    required this.qrStream,
  }) : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> qrStream;

  @override
  State<HesapMiddleSide2> createState() => _HesapMiddleSide2State();
}

class _HesapMiddleSide2State extends State<HesapMiddleSide2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          color: AppColors.amountBox,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Masadakiler",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: widget.qrStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const Text("Yükleniyor"));
            }
            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        data['ismi'],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        )
      ],
    );
  }
}
