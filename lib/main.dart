import 'package:financeiro_app/layers/get_asset/get_asset_binding.dart';
import 'package:financeiro_app/layers/get_asset/presentation/get_asset_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layers/graph_variation/presentation/graph_variation_page.dart';
import 'layers/list_variation/presentation/list_variation_page.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.native,
    locale: const Locale('pt', 'BR'),
    getPages: [
      GetPage(
        name: "/",
        page: () => const GetAssetPage(),
        binding: GetAssetBinding(),
      ),
      GetPage(
        name: "/list_variation",
        page: () => const ListVariationPage(),
      ),
      GetPage(
        name: "/graph_variation",
        page: () => const GraphVariationPage(),
      ),
    ],
  ));
}
