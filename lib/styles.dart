import 'package:flutter/material.dart';

class Styles{
  static const _textSizeLarge = 22.0;
  static const _textSizeDefault = 16.0;
  static const _textSizeSmall = 12.0;
  static const _mainTextColor = Colors.black;
  static final Color _textColorDefault = Colors.white;
  static const _itemBackgroundColor = Color(0xFFFFF3E0);
  static final String _fontNameDefault = 'Montserrat';

  static final itemTitleText = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    fontWeight: FontWeight.w600,
    color: _mainTextColor
  );

  static final itemDomainNameText = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeSmall,
    fontStyle: FontStyle.italic,
    color: _mainTextColor
  );

  static final itemInfoText = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeSmall,
    color: _mainTextColor
  );

  static final itemDecoration = BoxDecoration(
    color: _itemBackgroundColor
  );

  static final navBarTitle = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: _textSizeLarge,
    color: Colors.black
  );

  static final navBarSubtitle = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: _textSizeDefault,
    color: Colors.black
  );
  static final navBarBackgroundColor = Color(0xFFFFB74D);
  
}