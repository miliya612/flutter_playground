import 'dart:async';
import 'package:playground/data/entity/wallet_entity.dart';

abstract class WalletDataSource {
  Future<List<WalletEntity>> fetchWallet({bool refresh});
}