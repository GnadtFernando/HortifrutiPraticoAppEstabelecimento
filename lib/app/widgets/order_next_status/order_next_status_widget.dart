import 'package:app_painel_hortifruti_pratico/app/data/models/next_status.dart';
import 'package:app_painel_hortifruti_pratico/app/data/models/order_status.dart';
import 'package:flutter/material.dart';

typedef OnChangeStatus = void Function(int statusId);

class OrderNextStatusWidget extends StatelessWidget {
  final OnChangeStatus onChangeStatus;
  final OrderStatusModel currentStatus;
  OrderNextStatusWidget(this.currentStatus, this.onChangeStatus, {super.key});

  final nextStatusList = {
    1: [
      NextStatus(id: 2, text: 'Confirmar'),
      NextStatus(id: 5, text: 'Recusar', isOk: false)
    ],
    2: [
      NextStatus(id: 3, text: 'Saiu para entrega'),
      NextStatus(id: 5, text: 'Cancelar', isOk: false)
    ],
    3: [
      NextStatus(id: 4, text: 'Entregue'),
      NextStatus(id: 5, text: 'Cancelar', isOk: false)
    ]
  };

  @override
  Widget build(BuildContext context) {
    final options = nextStatusList[currentStatus.id];
    if (options == null) {
      return const SizedBox();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var nextStatus in options) ...[
          const SizedBox(width: 4),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: nextStatus.isOk ? Colors.green : Colors.red,
              side: BorderSide(
                color: nextStatus.isOk ? Colors.green : Colors.red,
              ),
            ),
            onPressed: () => onChangeStatus(nextStatus.id),
            child: Text(nextStatus.text),
          ),
          const SizedBox(width: 4),
        ]
      ],
    );
  }
}
