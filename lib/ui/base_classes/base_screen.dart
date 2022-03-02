import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_page_screen.dart';

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitle(),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: isBack
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    onClickBackButton();
                  },
                )
              : Container(),
          actions: [
            isCart
                ? IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      onClickCart();
                    },
                  )
                : Container()
          ],
        ),
        body: Container(
          child: body(),
          color: Colors.white,
        ));
  }

  Widget body();
}
