/*
*
* model的主目录
*
* */

import 'package:scoped_model/scoped_model.dart';
import 'package:app_dz/models/state_models/theme_state_model.dart';

class IndexStateModel extends Model with ThemeSateModels {

  static IndexStateModel of(context) => ScopedModel.of<IndexStateModel>(context,rebuildOnChange: true);
}