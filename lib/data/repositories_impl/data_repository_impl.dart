import 'package:watalook/data/server_api.dart';
import 'package:watalook/domain/repositories/data_repository.dart';

class DataRepositoryImpl extends DataRepository{
  final ServerApi _serverApi;

  DataRepositoryImpl(this._serverApi);
  @override
  Future<void> getData() async {
    _serverApi.getData();
  }

}