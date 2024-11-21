import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_ajaya/core/injection/injection.dart';
import 'package:weather_app_ajaya/core/session/i_session_manager.dart';

part 'saved_location_cubit.freezed.dart';
part 'saved_location_state.dart';

@injectable
class SavedLocationCubit extends Cubit<SavedLocationState> {
  SavedLocationCubit() : super(const SavedLocationState.initial());

  Future<void> saveLocation({required String name}) async {
    try {
      await getIt<ISessionManager>().saveLocation(name: name);
      emit(const _Success());
    } catch (e) {
      emit(const _Fail());
    }
  }

  Future<void> get() async {
    try {
      final response = await getIt<ISessionManager>().getSavedLocation();
      emit(_Data(name: response));
    } catch (e) {
      emit(const _Fail());
    }
  }
}
