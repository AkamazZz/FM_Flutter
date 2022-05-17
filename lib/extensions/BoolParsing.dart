extension BoolParsing on String{
  bool ParseBool(){
    if(this.toLowerCase() == 'true'){
      return true;
    }else if(this.toLowerCase() == 'false'){
      return false;
    }
    throw 'cannot be parsed';
  }
}