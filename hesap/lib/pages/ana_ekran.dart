import 'package:flutter/material.dart';

import 'package:hesap/components/hesap_floating_action_button.dart';
import 'package:hesap/components/hesap_bottom_navigation_bar.dart';
import 'package:hesap/pages/siparis_ekran.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const HesapFloatingActionButton(),
      bottomNavigationBar: const HesapBottomNavigationBar(),
    );
  }
}