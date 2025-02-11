
import 'package:news/model/sourceResponse.dart';

abstract class SourceRemoteDataSource{
  Future<SourceResponse> getSources(String categoryId);
}







///TODO:offline