class TextCompletionModel {
  final num created;
  final List<TextCompletionData> choices;

  TextCompletionModel({required this.created, required this.choices});

  factory TextCompletionModel.fromJson(Map<String, dynamic> json) {
    final textCompletionItems = json['choices'] as List;
    List<TextCompletionData> choices = textCompletionItems
        .map((singleItem) => TextCompletionData.fromJson(singleItem))
        .toList();

    return TextCompletionModel(
      choices: choices,
      created: json['created'],
    );
  }
}

class TextCompletionData {
  final String text;
  final num index;
  final String finishReason;

  TextCompletionData(
      {required this.text, required this.index, required this.finishReason});

  factory TextCompletionData.fromJson(Map<String, dynamic> json) {
    return TextCompletionData(
      text: json['text'],
      index: json['index'],
      finishReason: json['finish_reason'],
    );
  }
}
