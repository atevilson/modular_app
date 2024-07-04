
import 'package:app_modular/src/bloc/localization_event_bloc.dart';
import 'package:app_modular/src/bloc/localization_state_bloc.dart';
import 'package:app_modular/src/modules/commons_dependencies/lib/commons_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState(Locale('pt', 'BR'))) {
    on<ChangeLanguage>((event, emit) async {
      GetIt.I<LocalizationsApp>().load(event.locale);
      emit(LocalizationState(event.locale));
    });
  }
}
