// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../config/fetch_config.dart' as _i233;
import '../../features/homepage/data/repository/get_weather_repository.dart'
    as _i302;
import '../../features/homepage/domain/i_get_weather_controller/i_get_weather_controller.dart'
    as _i98;
import '../../features/homepage/domain/i_get_weather_repository/i_get_weather_repository.dart'
    as _i893;
import '../../features/homepage/presentation/bloc/weather_bloc.dart' as _i645;
import '../../features/homepage/presentation/cubit/saved_location_cubit.dart'
    as _i939;
import '../session/i_session_manager.dart' as _i697;
import '../session/session_manager.dart' as _i432;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i939.SavedLocationCubit>(() => _i939.SavedLocationCubit());
    gh.singleton<_i233.WeatherAppClient>(() => registerModule.quantumFetch);
    gh.factory<_i697.ISessionManager>(() => _i432.SessionManager());
    gh.factory<_i893.IGetWeatherRepository>(
        () => _i302.GetWeatherRepository(gh<_i233.WeatherAppClient>()));
    gh.factory<_i98.IGetWeatherController>(
        () => _i98.GetWeatherController(gh<_i893.IGetWeatherRepository>()));
    gh.factory<_i645.WeatherBloc>(
        () => _i645.WeatherBloc(gh<_i98.IGetWeatherController>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
