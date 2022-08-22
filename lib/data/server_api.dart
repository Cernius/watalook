import 'package:watalook/common/app_module.dart';
import 'package:watalook/domain/providers/logger.dart';
import 'package:watalook/domain/providers/preference_provider.dart';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';

class ServerApi {
  final PreferenceProvider _preferenceProvider;

  ServerApi(this._preferenceProvider);

  Future<http.Response> getData({
    Map<String, String>? query,
  }) async {
    Uri url = Uri.https(_preferenceProvider.getServerUrl(), 'graphql');

    dynamic response;
    response = await http.get(url);

    injector.get<Logger>().d("response: ${response.body}");
    return response;
  }
}
