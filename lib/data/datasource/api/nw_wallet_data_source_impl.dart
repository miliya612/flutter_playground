import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:playground/data/datasource/wallet_data_source.dart';
import 'package:playground/data/entity/wallet_entity.dart';

class NWWalletDataSourceImpl implements WalletDataSource {
  static const _BASE_URL = 'https://hogehoge.com';

  DateTime _cachedAt;
  List<WalletEntity> _cacheWalletResults;

  bool _isCacheExpired(DateTime time) {
    if (time == null) return true;
    Duration elapsed = time.difference(DateTime.now());
    if (elapsed.inSeconds > 3) {
      return true;
    }
    return false;
  }

  @override
  Future<List<WalletEntity>> fetchWallet({bool refresh = false}) async {
    if (refresh || _isCacheExpired(_cachedAt)) {
      await _requestAll();
    }
    return _cacheWalletResults;
  }


  _requestAll() async {
    var response = await http.get("$_BASE_URL");
    final decoded = json.decode(response.body) as List;
    _cachedAt = DateTime.now();
    final jsonMapList = decoded.cast<Map>();
    _cacheWalletResults = jsonMapList.map((e) => WalletEntity.fromMap(e)).toList();
    return _cachedAt;
  }
}