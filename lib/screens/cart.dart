/*
*ListView'ı boş bir banyo duvarı gibi düşünürsek listTile kullanarak bu duvarı
* fayanslarla kaplıyoruz.
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //başlık
        Center(
          child: Text(
            "Cart",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.red[400],
            ),
          ),
        ),
        //ürünler


      ],
    );
  }
}
