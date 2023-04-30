import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:app_painel_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_widget.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/weight_widget.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  final bool isKg;

  const QuantityAndWeightWidget({
    Key? key,
    required this.isKg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) => Column(
        children: [QuantityWidget(), if (isKg) WeightWidget()],
      ),
    );
  }
}
