import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/data/repository/weather_repository.dart';
import 'package:weather_application/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetchedEvent>(_getCurrentWeather);
  }

  Future<void> _getCurrentWeather(
    WeatherFetchedEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final weatherData = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weatherData));
    } catch (e) {
      emit(WeatherFailure(errorMessage: e.toString()));
    }
  }
}
