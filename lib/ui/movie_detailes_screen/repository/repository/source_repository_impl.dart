import 'package:news/model/sourceResponse.dart';
import 'package:news/repository/sources/dataSources/source_remote_data_source.dart';
import 'package:news/repository/sources/repository/source_repository.dart';

class SourceRepositoryImpl extends SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse> getSource(String categoryId) {
   return remoteDataSource.getSources(categoryId);
  }
  
}