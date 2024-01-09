class OpenOrdersCubitState{
  OpenOrdersCubitState({ this.shouldRebuild = false });
  bool shouldRebuild;
  OpenOrdersCubitState copyWith(
      {
        bool? shouldRebuild,
      }) {
    return OpenOrdersCubitState(
      shouldRebuild: shouldRebuild ?? this.shouldRebuild,
    );
  }
}