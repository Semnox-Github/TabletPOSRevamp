
class EditProductMenuState {
  EditProductMenuState(
      {this.isLoading = false,
        this.isSuccess = false,
        this.isError = false,
        this.loaderMessage = '',
        this.statusMessage = '',
        this.isActive = false
       });

  bool isLoading;
  bool isSuccess;
  bool isError;
  String loaderMessage;
  String statusMessage;
  bool isActive;

  EditProductMenuState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? loaderMessage,
    String? statusMessage,
    bool? isActive,
  }) {
    return EditProductMenuState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        loaderMessage: loaderMessage ?? this.loaderMessage,
        statusMessage: statusMessage ?? this.statusMessage,
        isActive: isActive ?? this.isActive
    );
  }
}
