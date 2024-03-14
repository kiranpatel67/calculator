import 'package:flutter/cupertino.dart';

extension IntExtension on int{
         EdgeInsetsGeometry addPadding(){
           return EdgeInsets.all(this.toDouble());
}
}

