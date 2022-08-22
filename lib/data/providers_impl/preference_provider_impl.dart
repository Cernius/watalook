import 'package:watalook/domain/providers/preference_provider.dart';

class PreferenceProviderImpl extends PreferenceProvider {
  @override
  String getServerUrl() {
    return 'watalook-demo-graphql.herokuapp.com';
  }
}
