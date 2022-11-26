import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utilities/colors.dart';

import '../pages/country.dart';

Widget myDrobDowmList({
  required BuildContext context,
  required void onChange(Country Country),
}) {
  return Padding(
    padding: const EdgeInsets.all(
      8.0,
    ),
    child: DropdownButton(
      isDense: true,
      enableFeedback: true,
      icon: Icon(Icons.place_outlined),
      iconEnabledColor: Theme.of(context).focusColor,
      isExpanded: true,
      hint: Text(
        'Choose Country',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
      underline: SizedBox(),
      items: Country.countrylist().map<DropdownMenuItem>((value) {
        return DropdownMenuItem(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(value.countryName),
              SizedBox(
                width: 15,
              ),
              Image.network(
                fit: BoxFit.cover,
                value.image.toString(),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (Country) {
        onChange(Country!);
      },
    ),
  );
}
