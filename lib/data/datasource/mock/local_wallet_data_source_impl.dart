import 'dart:async';

import 'package:playground/data/datasource/mock/res/mock_wallet.dart';
import 'package:playground/data/datasource/wallet_data_source.dart';
import 'package:playground/data/entity/wallet_entity.dart';

class LocalWalletDataSourceImpl  implements WalletDataSource {

  @override
  Future<List<WalletEntity>> fetchWallet({bool refresh}) async {
    return mockWallet.map((e) => WalletEntity.fromMap(e)).toList();
  }
}