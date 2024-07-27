
import 'package:commons_dependencies/bloc/localization_event_bloc.dart';
import 'package:commons_dependencies/bloc/localization_state_bloc.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/cupertino.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState(Locale('pt', 'BR'))) {
    on<ChangeLanguage>((event, emit) async {
      GetIt.I<LocalizationsApp>().load(event.locale);
      emit(LocalizationState(event.locale));
    });
  }
}
