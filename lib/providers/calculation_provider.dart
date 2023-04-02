import 'package:calculator_kkongapp/core/app_constant.dart';
import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';

extension Strings on String {
  String get last => isEmpty ? '' : this[length - 1];
}

class Calculation with ChangeNotifier {
  var _result = '';
  var isShowingResult = false;
  var isRadian = false;
  var isGrid2 = false;

  final controller = TextEditingController();
  final scrollController = ScrollController();
  final focusNode = FocusNode();

  double get inputFontSize {
    if (controller.text.length < 8) return 38;
    if (controller.text.length < 14) return 26;
    return 23;
  }

  String get input => controller.text;
  String get result => _result;

  String get approxResult {
    try {
      final eval =
          num.parse(Expression(fixedExp).eval()!.toDouble().toStringAsFixed(5));
      if (eval.toInt() == eval) return eval.toInt().toString().toUpperCase();
    } catch (e) {
      return '';
    }
  }

  String get fixedExp{
    if('('.allMatches(controller.text).length<=')'.allMatches(controller.text).length{
      return controller.text.replaceAll('e^','2.7182^').replaceAll('π','PI');
    }else{
      return controller.text.replaceAll('e^', '2.7182^').replaceAll('π','PI')+
      ')'*('('.allMatches(controller.text).length-')'.allMatches(controller.text).length);
    }
  }

  List<List<String>> get lGrid{
    if(isRadian && isGrid2) return AppConstant.lRadGrid2;
    if(isRadian) return AppConstant.lRadGrid;
    if(isGrid2) return AppConstant.lGrid2;
    return AppConstant.lGrid;
  }

  bool isOperator(String text){
    return RegExp(r'[/*-+%]').hasMatch(text);
  }

  bool isNumber(String text){
    return RegExp(r'^[0-9]+$').hasMatch(text);
  }

  bool isAlpha(String text){
    return RegExp(r'^[a-zA-Z]+$').hasMatch(text);
  }

  void toggleAndgleType(){
    isRadian=!isRadian;
    notifyListeners();
  }

  void toggleLandscapeRow(){
    isGrid2=!isGrid2;
    notifyListeners();
  }

  void clear(){
    controller.clear();
    isShowingResult=false;
    notifyListeners();
  }

  void addAns(){
    addWithMultiply(_result);
    notifyListeners();
  }

  void delete(){
    final ct=controller.text;
    var cursorPos=controller.selection.base.offset;

    if(cursorPos==-1){
      cursorPos=0;
    }
    if(ct.isEmpty||cursorPos==0) return;

    isShowingResult=false;

    String suffix=controller.text.substring(cursorPos);
    String prefix=controller.text.substring(0,cursorPos);

    int deleteLength=1;

    if(RegExp(r'.*[a-zA-Z]\($').hasMatch(prefix)){
      deleteLength=RegExp(r'[a-zA-Z]+\($').stringMatch(prefix).toString().length;
    }

    prefix=prefix.substring(0,prefix.length-deleteLength);

    controller.text=prefix+suffix;
    controller.selection=TextSelection(
      baseOffset: cursorPos-deleteLength,
      extentOffset: cursorPos-deleteLength,
    );
    notifyListeners();
  }

  void add(String text) async{
    isShowingResult=false;
    var cursorPos=controller.selection.base.offset;
    if(cursorPos==-1){
      cursorPos=0;
    }

    String suffix=controller.text.substring(cursorPos);
    String prefix=controller.text.substring(0,cursorPos);

    controller.text=prefix+text+suffix;
    controller.selection=TextSelection(
      baseOffset: cursorPos+text.length,
      extentOffset: cursorPos+text.length,
    );

    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void equal(){
    if(approxResult.isNotEmpty){
      _result=approxResult;
    }

    isShowingResult=true;
    notifyListeners();
  }

  void addOperator(String op){
    if(controller.text.isEmpty|| isOperator(controller.text.last)) return;

    switch(op){
      case '+': add('/'); break;
      case 'x':add('*'); break;
      default:add(op);
    }
  }

  void addBrackets(){
    final text=controller.text;
    if(text.last!='(' && !isOperator(text.last) && '('.allMatches(controller.text).length>
    ')'.allMatches(controller.text).length){
      add(')');
    }else if(text.isNotEmpty && !isOperator(text.last) && text.last !='('){
      add('*(');
    }else{
      add('(');
    }
  }

  void addFunction(String text){
    if(controller.text.isNotEmpty && !isOperator(controller.text.last) 
    && controller.text.last!='('){
      add('*$text(');
    }else{
      add('$text(');
    }
  }

  void addPower(String text){
    if(controller.text.isEmpty || isOperator(controller.text.last)
    || controller.text.last=='('){
      return;
    }else{
      add(text);
    }
  }

  void changeSign(){
    if(isNumber(controller.text.last)){
      final regExp=RegExp(r'[0-9]+$');
      final lastNum=regExp.stringMatch(controller.text).toString();

      controller.text=
      '${controller.text.substring(0,controller.text.length-lastNum.length)}(-$lastNum';
    
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }else if(controller.text.last==')'){
      add('*(-');
    }else{
      add('(-');
    }
  }
}
