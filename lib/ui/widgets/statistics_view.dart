import 'package:flutter/material.dart';

import '../../models/statistics_model.dart';
import '../../res/app_colors.dart';
import '../../util/app_constants.dart';

class StatisticsView extends StatelessWidget {
  final StatisticsModel statisticsModel;

  final Function(AppNavActions? action) onItemClick;

  const StatisticsView(
      {Key? key, required this.statisticsModel, required this.onItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClick(statisticsModel.action);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.primary),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(statisticsModel.stat.toString()+"+",style: const TextStyle(color: Colors.white,fontSize: 26),),
              const SizedBox(
                height: 16,
              ),
              Text(
                statisticsModel.title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}