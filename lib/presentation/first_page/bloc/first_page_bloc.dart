import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watalook/domain/repositories/data_repository.dart';

class FirstPageBloc extends Cubit<void> {
  final DataRepository _dataRepository;

  FirstPageBloc(this._dataRepository) : super(null);

  Future<void> getData() async {
    _dataRepository.getData();
  }
}
