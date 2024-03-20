import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_bank/utils/app_palette.dart';
import 'package:go_bank/utils/routes.dart';

class CurrentView extends StatefulWidget {
  const CurrentView({Key? key}) : super(key: key);

  @override
  State<CurrentView> createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.primary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 25),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesApp.HOME);
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_rounded,
                        color: AppPalette.white, size: 20),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/cartao.svg',
                      height: 24,
                      width: 37,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildContainer(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: RichText(
                text: const TextSpan(
                  text: 'ÚLTIMA FATURA\n',
                  style: TextStyle(fontSize: 16, color: AppPalette.white),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'R\$ 128,25\n', style: TextStyle(fontSize: 40)),
                    TextSpan(
                        text: 'Vencimento dia', style: TextStyle(fontSize: 16)),
                    TextSpan(
                        text: ' 28 JAN',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Container(
                  width: 175,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppPalette.white, width: 1)),
                  child: const Text(
                    "Enviar fatura por e-mail",
                    style: TextStyle(color: AppPalette.white),
                    textAlign: TextAlign.center,
                  )),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: AppPalette.primary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            bottomLeft: Radius.circular(2)))),
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 5,
                    color: AppPalette.red),
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 5,
                    color: AppPalette.blue),
                Container(
                  width: MediaQuery.of(context).size.width / 10,
                  height: 5,
                  color: AppPalette.yellow,
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 607,
              color: AppPalette.white1,
              child: buildCurrent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCurrent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Container(
          width: 271,
          height: 25,
          decoration: BoxDecoration(
              color: AppPalette.white, borderRadius: BorderRadius.circular(10)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Pagamento recebido",
                  style: TextStyle(color: AppPalette.black2)),
              Text(
                "R\$ 198,41",
                style: TextStyle(color: AppPalette.primary),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                "JAN",
                style: TextStyle(
                    color: AppPalette.gray2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildPurchase(AppPalette.yellow, 'assets/icons/compra.svg',
                'Supermercado\n', "Batalha\n", "R\$ 39,98", "16 JAN"),
            const SizedBox(
              height: 10,
            ),
            buildPurchase(AppPalette.primary, 'assets/icons/dinheiro.svg',
                'Outros\n', "Docinhos da vovó\n", "R\$ 9,00", "01 JAN"),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "2019",
                      style: TextStyle(
                          color: AppPalette.gray2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 200,
                      height: 1,
                      color: AppPalette.gray,
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            buildPurchase(AppPalette.red, 'assets/icons/raio.svg', 'Saúde\n',
                "Drogaria leila\n", "R\$ 8,50", "27 DEZ"),
            const SizedBox(
              height: 10,
            ),
            buildPurchase(AppPalette.blue, 'assets/icons/smile.svg', 'Lazer\n',
                "Pousada beira-rio\n", "R\$ 44,50", "27 DEZ"),
            const SizedBox(
              height: 10,
            ),
            buildPurchase(AppPalette.primary, 'assets/icons/dinheiro.svg',
                'Outros\n', "Zum\n", "R\$ 21,00", "23 DEZ"),
          ]),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget buildPurchase(Color color1, String icon, String tipo, String local,
      String valor, String data) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(75)),
                child: Center(child: SvgPicture.asset(icon)),
              ),
              const SizedBox(
                width: 15,
              ),
              RichText(
                text: TextSpan(
                  text: tipo,
                  style: const TextStyle(
                      fontSize: 11,
                      color: AppPalette.black2,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: local,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: valor,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
          Text(
            data,
            style: const TextStyle(color: AppPalette.gray2, fontSize: 11),
          )
        ],
      ),
    );
  }

  Widget buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 9.38,
          width: 9.38,
          decoration: BoxDecoration(
              color: AppPalette.white, borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 9.38,
          width: 9.38,
          decoration: BoxDecoration(
              color: AppPalette.gray1, borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 9.38,
          width: 9.38,
          decoration: BoxDecoration(
              color: AppPalette.gray1, borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 9.38,
          width: 9.38,
          decoration: BoxDecoration(
              color: AppPalette.gray1, borderRadius: BorderRadius.circular(5)),
        ),
      ],
    );
  }
}
