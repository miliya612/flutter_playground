import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playground/di/repository_factory.dart';
import 'package:playground/model/wallet_model.dart';

class BalancePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _BalancePageState createState() => new _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  List<WalletModel> _wallets;

  @override
  Widget build(BuildContext context) {
    if (_wallets == null) {
      return new Center(
        child: const CircularProgressIndicator(),
      );
    }
    return new Container(
      // A top margin of 56.0. A left and right margin of 8.0. And a bottom margin of 0.0.
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        // A column widget can have several widgets that are placed in a top down fashion
        children: <Widget>[BalanceListWidget(_wallets)],
      ),
    );
  }

  @override
  Future initState() {
    super.initState();

    new RepositoryFactory().getWalletRepository().findAll().then((r) {
      setWallets(r.toList());
    });
  }

  void setWallets(List<WalletModel> wallets) {
    setState(() {
      _wallets = wallets;
    });
  }
}

class BalanceListWidget extends StatelessWidget {
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  List _wallets;

  BalanceListWidget(this._wallets);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return new Container(
      // A top margin of 56.0. A left and right margin of 8.0. And a bottom margin of 0.0.
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: _getListViewWidget(),
    );
  }

  Widget _getListViewWidget() {
    // We want the ListView to have the flexibility to expand to fill the
    // available space in the vertical axis
    return new ListView.builder(
            // The number of items to show
            itemCount: _wallets.length,
            // Callback that should return ListView children
            // The index parameter = 0...(itemCount-1)
            itemBuilder: (context, index) {
              // Get the currency at this position
              final WalletModel wallet = _wallets[index];

              // Get the icon color. Since x mod y, will always be less than y,
              // this will be within bounds
              final MaterialColor color = _colors[index % _colors.length];

              return _getListItemWidget(wallet, color);
            });
  }

  CircleAvatar _getLeadingWidget(String currencyName, MaterialColor color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: new Text(currencyName[0]),
    );
  }

  Text _getTitleWidget(String currencyName) {
    return new Text(
      currencyName,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Text _getSubtitleText(String amount) {
    return new Text(amount);
  }

  ListTile _getListTile(WalletModel wallet, MaterialColor color) {
    return new ListTile(
      leading: _getLeadingWidget(wallet.currency.code, color),
      title: _getTitleWidget(wallet.currency.code),
      subtitle: _getSubtitleText(wallet.amount.toString()),
      isThreeLine: true,
    );
  }

  Container _getListItemWidget(WalletModel wallet, MaterialColor color) {
    // Returns a container widget that has a card child and a top margin of 5.0
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new SizedBox(
        height: 100.0,
        child: new Card(
          child: _getListTile(wallet, color),
        ),
      )
    );
  }
}
