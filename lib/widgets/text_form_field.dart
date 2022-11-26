import 'package:flutter/material.dart';
import 'package:news_app/utilities/colors.dart';

Widget MyTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  required String? Function(String?) validate,
  required String lable,
  required IconData preFix,
  IconData? suffix,
  bool isItPassword = false,
  bool isClicakable = true,
  void Function()? suffixpressed,
  void Function()? onTap,
  bool showCursor = false,
  bool readOnly = false,
  required BuildContext context,
}) =>
    TextFormField(
      maxLines: 1,
      style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
      showCursor: showCursor,
      readOnly: readOnly,
      enabled: isClicakable,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isItPassword,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Theme.of(context).focusColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
              width: 2.0,
            )),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpressed,
                icon: Icon(suffix),
              )
            : null,
        labelText: lable,
        prefixIcon: Icon(
          color: Theme.of(context).focusColor,
          preFix,
        ),
      ),
      validator: validate,
      onTap: onTap,
    );
