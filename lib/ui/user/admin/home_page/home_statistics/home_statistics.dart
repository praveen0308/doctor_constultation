import 'package:doctor_consultation/ui/user/admin/home_page/home_statistics/home_statistics_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/statistics_view.dart';

class HomeStatistics extends StatefulWidget {
  const HomeStatistics({Key? key}) : super(key: key);

  @override
  State<HomeStatistics> createState() => _HomeStatisticsState();
}

class _HomeStatisticsState extends State<HomeStatistics> {
  late HomeStatisticsCubit _cubit;


  @override
  void initState() {
    _cubit = BlocProvider.of<HomeStatisticsCubit>(context);
    _cubit.getHomeStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeStatisticsCubit, HomeStatisticsState>(
      builder: (context, state) {
        if(state is Error){
          return SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const Icon(
                  Icons.error
              ),const SizedBox(width: 16,),Text(state.msg)],
            ),
          );
        }
        if(state is ReceivedStats){
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.stats.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.75,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4),
              itemBuilder: (_, index) {
                return StatisticsView(
                    statisticsModel: state.stats[index],
                    onItemClick: (action) {
                      // navigateQuickActions(action!);
                    });
              });
        }
        return const LoadingView(isVisible: true);


      },
    );
  }
}
