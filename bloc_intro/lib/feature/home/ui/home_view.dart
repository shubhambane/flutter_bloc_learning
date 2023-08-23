// ignore_for_file: prefer__ructors

import 'package:bloc_intro/feature/home/bloc/home_bloc.dart';
import 'package:bloc_intro/feature/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    homeBloc.add(
      HomeInitialEvent(),
    );
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageState) {
          Navigator.of(context).pushNamed('/cartView');
        } else if (state is HomeNavigateToWishListPageState) {
          Navigator.of(context).pushNamed('/wishlistView');
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('HomeView'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductWishlistButtonNavigateEvent(),
                      );
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductCartButtonNavigateEvent(),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );

          case HomeLoadedFailureState:
            return Scaffold(
              body: Center(
                child: Text(
                  'Error',
                ),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
