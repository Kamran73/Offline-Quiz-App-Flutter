import 'questions.dart';
class QuizBrain{
  List<Question> _question = [
    Question('Friends star Lisa Kudrow was originally cast in the sitcom Frasier', true),
    Question('If you’re born between May 1st and 20th, then you’re a Gemini', true),
    Question('Emma Roberts is the daughter of Julia Roberts', false),
    Question('There are over 2,500 stars on the Hollywood Walk of Fame', true),
    Question('Fruit flies were the first living creatures sent into space', false),
    Question('Cyclones spin in a clockwise direction in the southern hemisphere', false),
  ];
  int _length;

  Question getBank(int index){
    return _question[index];
  }
  int getLength(){
    return _question.length;
  }

}