import 'package:get_it/get_it.dart';

import '../blocs/localization/localization_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LocalizationBloc());
}
