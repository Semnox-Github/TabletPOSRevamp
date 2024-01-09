class SetUpMenuDashBoardState {
  SetUpMenuDashBoardState({
    this.isLoading = false,
    this.selectedButtonValue ='PANELS',
    this.showSideBar= true
  });

  bool isLoading;
  String? selectedButtonValue;
  bool showSideBar;

  SetUpMenuDashBoardState copyWith({
    bool? isLoading,
    String? selectedButtonValue,
    bool? showSideBar,
  }) {
    return SetUpMenuDashBoardState(
      isLoading: isLoading ?? this.isLoading,
        selectedButtonValue: selectedButtonValue ?? this.selectedButtonValue,
        showSideBar:showSideBar ?? this.showSideBar
    );
  }
}
