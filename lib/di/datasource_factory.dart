
import 'package:playground/data/datasource/mock/local_wallet_data_source_impl.dart';
import 'package:playground/data/datasource/wallet_data_source.dart';

class DataSourceFactory {
  static final DataSourceFactory _dataSourceFactory = new DataSourceFactory._internal();

  WalletDataSource _walletDataSource;

  factory DataSourceFactory() {
    return _dataSourceFactory;
  }

  DataSourceFactory._internal() {
    _walletDataSource = _provideWalletDataSource();
  }

  // providers
  WalletDataSource _provideWalletDataSource() {
    return new LocalWalletDataSourceImpl();
  }

  // getters
  WalletDataSource getWalletDataSource() {
    return _walletDataSource;
  }

}