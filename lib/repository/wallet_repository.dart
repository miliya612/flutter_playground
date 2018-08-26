import 'dart:async';

import 'package:money/money.dart';
import 'package:playground/model/wallet_model.dart';

abstract class WalletRepository {
  Future<List<WalletModel>> findAll({bool refresh});
  Future<WalletModel> findByCurrency(Currency currency, {bool refresh});
}