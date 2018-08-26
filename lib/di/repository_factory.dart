import 'package:playground/di/datasource_factory.dart';
import 'package:playground/repository/impl/wallet_repository_impl.dart';
import 'package:playground/repository/wallet_repository.dart';

class RepositoryFactory {
  static final RepositoryFactory _singleton = new RepositoryFactory._internal();

  factory RepositoryFactory() {
    return _singleton;
  }
  DataSourceFactory _ds;

  WalletRepository _walletRepository;

  RepositoryFactory._internal() {
    _ds = new DataSourceFactory();
    _walletRepository = _provideWalletRepository();
  }

  // providers
  WalletRepository _provideWalletRepository() {
    return new WalletRepositoryImpl(_ds.getWalletDataSource());
  }

  // getters
  WalletRepository getWalletRepository() {
    return _walletRepository;
  }
}