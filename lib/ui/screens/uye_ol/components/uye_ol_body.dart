import 'package:flutter/material.dart';
import '../../../theme/insets.dart';
import '../../../widgets/hesap_button.dart';
import '../../../widgets/hesap_text_field.dart';

class UyeOlBody extends StatelessWidget {
  const UyeOlBody({
    Key? key,
    required this.setUsername,
    required this.setEmail,
    required this.setPhone,
    required this.setPassword,
    required this.setPasswordAgain,
    required this.confirm,
  }) : super(key: key);

  final Function(String) setUsername;
  final Function(String) setEmail;
  final Function(String) setPhone;
  final Function(String) setPassword;
  final Function(String) setPasswordAgain;
  final VoidCallback confirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/qr.png"),
          alignment: Alignment.bottomLeft,
          fit: BoxFit.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.l),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HesapTextField(
              label: "Kullanıcı Adı",
              prefixIcon: const Icon(Icons.person_rounded),
              onChanged: setUsername,
            ),
            HesapTextField(
              label: "E-posta",
              prefixIcon: const Icon(Icons.email_rounded),
              keyboardType: TextInputType.emailAddress,
              onChanged: setEmail,
            ),
            HesapTextField(
              label: "Telefon",
              prefixIcon: const Icon(Icons.phone_rounded),
              keyboardType: TextInputType.phone,
              onChanged: setPhone,
            ),
            HesapTextField(
              label: "Şifre",
              prefixIcon: const Icon(Icons.password_rounded),
              keyboardType: TextInputType.number,
              maxLength: 6,
              obscureText: true,
              onChanged: setPassword,
            ),
            HesapTextField(
              label: "Şifre (Tekrar)",
              prefixIcon: const Icon(Icons.password_rounded),
              keyboardType: TextInputType.number,
              maxLength: 6,
              obscureText: true,
              onChanged: setPasswordAgain, // TODO: Şifre kontrolü
            ),
            Row(
              children: [
                HesapButton(
                  enabled: true,
                  label: 'Kaydı Tamamla',
                  filled: true,
                  onPressed: confirm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}