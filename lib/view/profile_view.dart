import 'package:flutter/material.dart';
import 'package:go_bank/utils/app_palette.dart';
import 'package:go_bank/utils/routes.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.white1,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80)),
                  color: AppPalette.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RoutesApp.HOME);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 45, bottom: 10, top: 20),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_rounded,
                                color: AppPalette.white, size: 20),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Voltar",
                                style: TextStyle(
                                    color: AppPalette.white, fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 97,
                          width: 97,
                          padding: const EdgeInsets.all(8 - 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            color: AppPalette.white,
                          ),
                          child: Image.asset('assets/images/perso.png',
                              width: 90, height: 90, fit: BoxFit.cover),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Banco 170 - Go bank S.A.",
                              style: TextStyle(
                                  color: AppPalette.white, fontSize: 14),
                            ),
                            Text(
                              "Agência 0001",
                              style: TextStyle(
                                  color: AppPalette.white, fontSize: 14),
                            ),
                            Text(
                              "Conta 1467023-9",
                              style: TextStyle(
                                  color: AppPalette.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Geral",
                      style: TextStyle(
                          color: AppPalette.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    buildConfigure("Configurar perfil"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildConfigure("Configurar conta"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildConfigure("Quero uma conta PJ"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildConfigure("Solicitar empréstimo"),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Configurar cartões",
                      style: TextStyle(
                          color: AppPalette.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildConfigureCard(AppPalette.purple, "\$200,25", "0914"),
                    const SizedBox(
                      height: 10,
                    ),
                    buildConfigureCard(AppPalette.pinklight, "\$570,50", "4051")
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConfigure(String text) {
    return Container(
      width: 300,
      height: 46,
      decoration: BoxDecoration(
          color: AppPalette.white, borderRadius: BorderRadius.circular(15)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: AppPalette.black),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppPalette.primary,
          size: 14,
        )
      ]),
    );
  }

  Widget buildConfigureCard(Color color, String text, String num) {
    return Container(
      width: 300,
      height: 82,
      decoration: BoxDecoration(
          color: AppPalette.white, borderRadius: BorderRadius.circular(15)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
            height: 36,
            width: 36,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: color),
            child: Image.asset(
              'assets/images/flag.png',
              width: 21,
              height: 13,
              fit: BoxFit.contain,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mastercard',
              style: TextStyle(fontSize: 14, color: AppPalette.black),
            ),
            Text(
              '**** ${num}',
              style: const TextStyle(fontSize: 12, color: AppPalette.gray2),
            ),
          ],
        ),
        Text(
          text,
          style: const TextStyle(
              color: AppPalette.primary, fontWeight: FontWeight.bold),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppPalette.black,
          size: 14,
        )
      ]),
    );
  }
}
