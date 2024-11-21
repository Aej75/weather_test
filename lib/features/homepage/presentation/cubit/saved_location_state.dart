part of 'saved_location_cubit.dart';

@freezed
class SavedLocationState with _$SavedLocationState {
  const factory SavedLocationState.initial() = _Initial;
  const factory SavedLocationState.saveSuccess() = _Success;
  const factory SavedLocationState.failed() = _Fail;
  const factory SavedLocationState.data({String? name}) = _Data;
}
