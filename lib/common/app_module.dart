import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:watalook/data/providers_impl/logger_impl.dart';
import 'package:watalook/data/providers_impl/preference_provider_impl.dart';
import 'package:watalook/data/repositories_impl/data_repository_impl.dart';
import 'package:watalook/data/server_api.dart';
import 'package:watalook/domain/providers/logger.dart';
import 'package:watalook/domain/providers/preference_provider.dart';
import 'package:watalook/domain/repositories/data_repository.dart';
import 'package:watalook/presentation/first_page/bloc/first_page_bloc.dart';

class AppModule {
  Injector initialise(Injector injector) {
    injector.map<Logger>((injector) => LoggerImpl());
    injector.map<PreferenceProvider>((injector) => PreferenceProviderImpl());
    injector.map<ServerApi>(
      (injector) => ServerApi(
        injector.get<PreferenceProvider>(),
      ),
    );

    injector.map<FirstPageBloc>(
      (injector) => FirstPageBloc(
        injector.get<DataRepository>(),
      ),
    );
    injector.map<DataRepository>(
      (injector) => DataRepositoryImpl(
        injector.get<ServerApi>(),
      ),
    );

    return injector;
  }
}

Injector injector = AppModule().initialise(Injector());
