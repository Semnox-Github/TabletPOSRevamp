class ClosedOrdersCubitState{
  ClosedOrdersCubitState({ this.shouldRebuild = false });
  bool shouldRebuild;
  ClosedOrdersCubitState copyWith(
      {
        bool? shouldRebuild,
      }) {
    return ClosedOrdersCubitState(
      shouldRebuild: shouldRebuild ?? this.shouldRebuild,
    );
  }
}