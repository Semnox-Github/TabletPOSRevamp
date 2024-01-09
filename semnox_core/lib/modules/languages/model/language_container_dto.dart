class LanguageContainerDto {
  int? _languageId;
  String? _languageName;
  String? _languageCode;
  String? _cultureCode;
  LanguageContainerDto(
      {int? languageId,
      String? languageName,
      String? languageCode,
      String? cultureCode}) {
    _languageId = languageId;
    _languageName = languageName;
    _languageCode = languageCode;
    _cultureCode = cultureCode;
  }

  int? get languageId => _languageId;
  String? get languageName => _languageName;
  String? get languageCode => _languageCode;
  String? get cultureCode => _cultureCode;

  factory LanguageContainerDto.fromMap(Map<String, dynamic> json) =>
      LanguageContainerDto(
        languageId: json["LanguageId"],
        languageName: json["LanguageName"],
        languageCode: json["LanguageCode"],
        cultureCode: json["CultureCode"],
      );

  Map<String, dynamic> toMap() => {
        "LanguageId": languageId,
        "LanguageName": languageName,
        "LanguageCode": languageCode,
        "CultureCode": cultureCode,
      };

  static List<LanguageContainerDto>? getLanguageDTOList(
      List<dynamic>? languageDTOList) {
    if (languageDTOList == null) {
      return null;
    }

    List<LanguageContainerDto> _languageviewDTOList = [];
    for (var element in languageDTOList) {
      _languageviewDTOList.add(LanguageContainerDto.fromMap(element));
    }
    return _languageviewDTOList;
  }
}

enum LanguageViewDTOSearchParameter { HASH, REBUILDCACHE, SITEID } // Id