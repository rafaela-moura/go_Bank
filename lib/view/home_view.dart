import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_bank/utils/app_palette.dart';
import 'package:go_bank/utils/routes.dart';

enum CardType { Card1, Card2 }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CardType _currentCardType = CardType.Card1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.primary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesApp.PROFILE);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          color: AppPalette.white,
                        ),
                        child: Image.asset(
                          'assets/images/perso.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Olá, Samantha",
                        style: TextStyle(color: AppPalette.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              buildPanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPanel() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppPalette.white1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 146,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppPalette.white,
                  ),
                  child: const Center(
                    child: Text(
                      "Cartão de crédito",
                      style: TextStyle(
                        color: AppPalette.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppPalette.white,
                  ),
                  child: const Center(
                    child: Text(
                      "Conta",
                      style: TextStyle(
                        color: AppPalette.gray,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 40),
            child: Container(
              height: 200,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  buildCard(
                      AppPalette.pink,
                      AppPalette.pink1,
                      AppPalette.card1,
                      "6212  2115  5234  0914",
                      AppPalette.brown,
                      CardType.Card1),
                  buildCard(
                      AppPalette.primary,
                      AppPalette.card2,
                      AppPalette.card3,
                      "6212  2115  5234  4051",
                      AppPalette.white1,
                      CardType.Card2),
                ],
                onPageChanged: (int index) {
                  setState(() {
                    if (index == 0) {
                      _currentCardType = CardType.Card1;
                    } else if (index == 1) {
                      _currentCardType = CardType.Card2;
                    }
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 9.38,
                width: 9.38,
                decoration: BoxDecoration(
                    color: AppPalette.primary,
                    borderRadius: BorderRadius.circular(5)),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 9.38,
                width: 9.38,
                decoration: BoxDecoration(
                    color: AppPalette.gray1,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, RoutesApp.CURRENT);
            },
            child: Container(
              height: 170,
              width: 335,
              decoration: BoxDecoration(
                  color: AppPalette.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fatura atual",
                        style: TextStyle(
                            fontSize: 13.5,
                            color: AppPalette.gray2,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _currentCardType == CardType.Card1
                            ? "R\$ 570,50"
                            : 'R\$200,25',
                        style: TextStyle(
                            fontSize: 13.5,
                            color: _currentCardType == CardType.Card1
                                ? AppPalette.gray2
                                : AppPalette.red,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _currentCardType == CardType.Card1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 194,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: AppPalette.primary,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        bottomLeft: Radius.circular(2)))),
                            Container(
                                width: 49, height: 5, color: AppPalette.blue),
                            Container(
                                width: 28,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: AppPalette.yellow,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(2),
                                        bottomRight: Radius.circular(2))))
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 119,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: AppPalette.primary,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        bottomLeft: Radius.circular(2)))),
                            Container(
                                width: 75, height: 5, color: AppPalette.red),
                            Container(
                                width: 49, height: 5, color: AppPalette.blue),
                            Container(
                                width: 28,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: AppPalette.yellow,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(2),
                                        bottomRight: Radius.circular(2))))
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/face.png"),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Lazer\n',
                          style:
                              TextStyle(fontSize: 11, color: AppPalette.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Ebanx *Spotify\n',
                                style: TextStyle(fontSize: 14)),
                            TextSpan(
                                text: 'R\$ 8,50',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text("15 MAR", style: TextStyle(fontSize: 14))
                    ],
                  )
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 37,
            width: 335,
            decoration: BoxDecoration(
                color: AppPalette.white,
                borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Melhor dia para compra',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "21",
                    style: TextStyle(color: AppPalette.primary, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 37,
            width: 335,
            decoration: BoxDecoration(
                color: AppPalette.white,
                borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Limite disponível', style: TextStyle(fontSize: 12)),
                  Text(
                    "R\$972,62",
                    style: TextStyle(color: AppPalette.primary, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 134,
            width: 335,
            decoration: BoxDecoration(
                color: AppPalette.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildSettings('assets/icons/ajuste.svg', "Ajustar\nlimite"),
                    buildSettings('assets/icons/cartao.svg', "Cartão\nvirtual",
                        color: AppPalette.primary),
                    buildSettings(
                        'assets/icons/cartaoX.svg', "Bloquear\ncartão"),
                    buildSettings('assets/icons/ajuste.svg', "Fale\nconosco")
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettings(String caminho, String text, {Color? color}) {
    return Column(
      children: [
        Container(
          width: 51,
          height: 51,
          decoration: BoxDecoration(
              color: AppPalette.white1,
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              caminho,
              color: color,
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 13.5),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget buildCard(Color color1, Color color2, Color color3, String text,
      Color color4, CardType cardType) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, RoutesApp.CURRENT);
      },
      child: Container(
        height: 178.41,
        width: 298,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color1, color2, color3],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("go",
                  style: TextStyle(
                      color: AppPalette.white,
                      fontSize: 34,
                      fontFamily: "Open Sans")),
              Text(
                text,
                style: TextStyle(color: color4, fontSize: 23),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: color4, fontSize: 16),
                      children: const [
                        TextSpan(text: 'Samantha Kudrow\n '),
                        TextSpan(text: '02/27'),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/flag.png')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
