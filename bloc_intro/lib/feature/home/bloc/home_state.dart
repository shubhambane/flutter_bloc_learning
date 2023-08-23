part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeLoadedFailureState extends HomeState {
  // final String errorMessage;

  // HomeLoadedFailure(this.errorMessage);
}

class HomeProductWishListButtonClickedState extends HomeActionState {}

class HomeProductCartButtonClickedState extends HomeActionState {}

class HomeNavigateToWishListPageState extends HomeActionState {}

class HomeNavigateToCartPageState extends HomeActionState {}
