
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:common/main.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState(Locale('pt', 'BR'))) {
    on<ChangeLanguage>((event, emit) async {
      await GetIt.I<LocalizationsApp>().load(event.locale);
      emit(LocalizationState(event.locale));
    });
  }
}
