import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manugestao_app/src/pages/2_pages_buttom/page_clients/page_list_clientes.dart';
import 'package:manugestao_app/src/pages/widgets/ButtomHomePageWidget.dart';
import 'package:manugestao_app/src/pages/widgets/statusServiceWidget.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'lib/assets/logo-app.png',
          fit: BoxFit.fitHeight,
          height: 130,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const StatusServiceWidget(),
                ButtomHomePageWidget(
                  func: (() {
                    Get.to(() => PageListClientes());
                  }),
                  nameButtom: 'Clientes',
                ),
                ButtomHomePageWidget(
                  func: (() {}),
                  nameButtom: 'Entrada',
                ),
                ButtomHomePageWidget(
                  func: (() {}),
                  nameButtom: 'Ordem de Serviços',
                ),
                ButtomHomePageWidget(
                  func: (() {}),
                  nameButtom: 'Saída',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
