import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/services/database/database_service.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService.instance;
});
