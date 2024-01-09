class TranslationViewDtoList {
  TranslationViewDtoList(
      {int? messageId,
      int? messageNumber,
      String? message,
      String? translatedMessage}) {
    _messageId = messageId;
    _messageNumber = messageNumber;
    _message = message;
    _translatedMessage = translatedMessage;
  }

  int? _messageId;
  int? _messageNumber;
  String? _message;
  String? _translatedMessage;

  int? get messageId => _messageId;
  int? get messageNumber => _messageNumber;
  String? get message => _message;
  String? get translatedMessage => _translatedMessage;

  factory TranslationViewDtoList.fromJson(Map<String, dynamic> json) =>
      TranslationViewDtoList(
        messageId: json["MessageId"],
        messageNumber: json["MessageNumber"],
        message: json["Message"],
        translatedMessage: json["TranslatedMessage"],
      );

  Map<String, dynamic> toJson() => {
        "MessageId": messageId,
        "MessageNumber": messageNumber,
        "Message": message,
        "TranslatedMessage": translatedMessage,
      };

  static List<TranslationViewDtoList>? getTranslationViewDTOList(
      List<dynamic>? translationViewDTOList) {
    if (translationViewDTOList == null) {
      return null;
    }

    List<TranslationViewDtoList> _translationViewDTOList = [];
    for (var element in translationViewDTOList) {
      _translationViewDTOList.add(TranslationViewDtoList.fromJson(element));
    }

    return _translationViewDTOList;
  }
}

enum TranslationViewDTOSearchParameter {
  SITEID,
  LANGUAGEID,
  HASH,
  REBUILDCACHE
}
