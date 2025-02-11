import 'package:news/model/sourceResponse.dart';
import 'package:news/repository/sources/dataSources/source_remote_data_source.dart';
import '../../../api/api_manager.dart';
// SourceRemoteDataSourceImpl hna da api manager
///بدل ناخد الداتا كوبي بيست منapi manager   --- اعمل اوبجكت منه
class  SourceRemoteDataSourceImpl extends SourceRemoteDataSource{
    final ApiManager apiManager ;
  SourceRemoteDataSourceImpl({required this.apiManager})  ;
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}

