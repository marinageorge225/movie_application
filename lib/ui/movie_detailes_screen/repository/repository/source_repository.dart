//todo
import '../../../model/sourceResponse.dart';

abstract class SourceRepository{
    /// عايز اجيب مصادر الاخبار ف هروح اعمل ميثود اسمها (getSources)
Future <SourceResponse> getSource (String categoryId );
  }