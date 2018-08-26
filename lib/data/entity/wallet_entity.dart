import 'package:meta/meta.dart';
import 'package:money/money.dart';

class WalletEntity {
  final Currency currency;
  final double amount;

  factory WalletEntity.fromMap(Map jsonMap) {
    return WalletEntity._(
        currency: Currency(jsonMap['currency']), amount: jsonMap['amount']);
  }

  WalletEntity._({@required this.currency, @required this.amount});
}
