class Question{
  String _question;
  bool _answer;
  Question(String a, bool b){
    this._question = a;
    this._answer =b;
  }
  String getQuestion(){
    return _question;
  }
  bool getAnswer(){
    return _answer;
  }
}