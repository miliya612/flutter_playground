import 'package:money/money.dart';
import 'package:flutter/foundation.dart';
import 'package:playground/data/entity/wallet_entity.dart';

class WalletModel {
  final Currency currency;
  final double amount;

  WalletModel._({@required this.currency, @required this.amount});

  static WalletModel build(WalletEntity entity) {
    return WalletModel._(currency: entity.currency, amount: entity.amount);
  }
}
