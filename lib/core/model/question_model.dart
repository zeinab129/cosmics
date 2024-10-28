class QuestionModel {
  String question;
  List<String> choices;
  int trueChoice;
  int? selectedChoice;

  QuestionModel(
      {required this.question,
      required this.choices,
      required this.trueChoice, this.selectedChoice = -1});
}
