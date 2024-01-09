class AllOrdersCubitState{
  AllOrdersCubitState({ this.shouldRebuild = false });
  bool shouldRebuild;
 AllOrdersCubitState copyWith(
      {
      bool? shouldRebuild,
      }) {
    return AllOrdersCubitState(
      shouldRebuild: shouldRebuild ?? this.shouldRebuild,
    );
  }
}