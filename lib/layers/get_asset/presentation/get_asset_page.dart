import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_asset_controller.dart';

class GetAssetPage extends GetView<GetAssetController> {
  const GetAssetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Selecione o ativo"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: controller.onChangeNewAsset,
                decoration: InputDecoration(
                  labelText: "Pesquise um novo ativo",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: controller.addAssetClick,
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: controller.obx(
                  (state) => ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                    ),
                    itemCount: state!.length,
                    itemBuilder: ((context, index) {
                      var item = state[index];
                      return ListTile(
                          title: Text(item),
                          onTap: () {
                            controller.selectAssetClick(item);
                          },
                          trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                controller.delAssetClick(item);
                              }));
                    }),
                  ),
                  onEmpty:
                      const Center(child: Text("Nenhum ativo listado ainda")),
                  onError: (error) => Center(child: Text(error!)),
                ),
              ),
            ],
          ),
        ));
  }
}
