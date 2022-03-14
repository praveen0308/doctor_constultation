import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_videos_state.dart';

class ManageVideosCubit extends Cubit<ManageVideosState> {
  ManageVideosCubit() : super(ManageVideosInitial());
}
