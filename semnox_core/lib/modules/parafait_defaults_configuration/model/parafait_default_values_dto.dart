class ParafaitDefaultValueDto {
  String? _name;
  String? _value;
  ParafaitDefaultValueDto({String? name, String? value}) {
    _name = name;
    _value = value;
  }

  String? get name => _name;
  String? get value => _value;

  Map<String, dynamic> toMap() {
    return {
      'DefaultValueName': name,
      'DefaultValue': value,
    };
  }

  factory ParafaitDefaultValueDto.fromMap(Map<String, dynamic> map) {
    return ParafaitDefaultValueDto(
      name: map['DefaultValueName'],
      value: map['DefaultValue'],
    );
  }

  static List<ParafaitDefaultValueDto>? getParafaitDefaultDTOList(
      List<dynamic>? parafaitDefaultDTOList) {
    if (parafaitDefaultDTOList == null) {
      return null;
    }

    List<ParafaitDefaultValueDto> _parafaitDefaultDTOList = [];
    for (var element in parafaitDefaultDTOList) {
      _parafaitDefaultDTOList.add(ParafaitDefaultValueDto.fromMap(element));
    }

    return _parafaitDefaultDTOList;
  }

  static dynamic getListMap(List<dynamic> items) {
    if (items == null) {
      return null;
    }
    List<Map<String, dynamic>> list = [];
    items.forEach((element) {
      list.add(element.toMap());
    });
    return list;
  }
}

enum ParafaitDefaultValueDTOSearchParameter { HASH, REBUILDCACHE, SITEID } // Id
