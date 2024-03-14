extension stringExtention on String{
  String keepOnlyText(){
    return replaceAll(RegExp(r'([x,y,X,Y])'), '');
  }
}