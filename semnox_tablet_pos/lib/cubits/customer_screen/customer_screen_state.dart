class CustomerScreenState {
  CustomerScreenState({
    this.isLoading = false,
    this.selectedButtonValue ='New',
    this.showSideBar= true
  });

  bool isLoading;
  String? selectedButtonValue;
  bool showSideBar;

  CustomerScreenState copyWith({
    bool? isLoading,
    String? selectedButtonValue,
    bool? showSideBar,
  }) {
    return CustomerScreenState(
      isLoading: isLoading ?? this.isLoading,
        selectedButtonValue: selectedButtonValue ?? this.selectedButtonValue,
        showSideBar:showSideBar ?? this.showSideBar
    );
  }
}
