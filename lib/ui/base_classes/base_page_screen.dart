import 'package:flutter/cupertino.dart';

abstract class BasePageScreen extends StatefulWidget {
  const BasePageScreen({Key? key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen>
    extends State<Page> {
  bool isBack = true;
  bool isCart = true;

  String appBarTitle();

  void onClickBackButton();

  void onClickCart();

  void isBackButton(bool isBack) {
    isBack = isBack;
  }

  void isCartButton(bool isCart) {
    isCart = isCart;
  }
}
