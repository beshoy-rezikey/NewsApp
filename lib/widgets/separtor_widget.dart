import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utilities/colors.dart';

Widget seperatorWidegt() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
    child: Container(
      width: double.infinity,
      height: 1,
      color: MyColors.red,
    ),
  );
}
