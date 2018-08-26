import 'dart:async';

import 'package:money/money.dart';
import 'package:playground/data/datasource/wallet_data_source.dart';
import 'package:playground/model/wallet_model.dart';
import 'package:playground/repository/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  WalletDataSource _ds;

  bool isDirty = true;

  WalletRepositoryImpl(this._ds);

  @override
  Future<WalletModel> findByCurrency(Currency currency,
      {bool refresh = false}) {
    return findAll(refresh: refresh).then((wallets) {
      return wallets.firstWhere((wallet) => wallet.currency == currency);
    });
  }

  @override
  Future<List<WalletModel>> findAll({bool refresh = false}) {
    return _ds.fetchWallet(refresh: refresh).then((entities) {
      return entities.map((entity) {
        WalletModel.build(entity);
      }).toList();
    });
  }
}
