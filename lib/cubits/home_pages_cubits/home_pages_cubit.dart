import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/home_pages_cubits/home_pages_states.dart';

class HomePagesCubit extends Cubit<HomePagesStates> {
  HomePagesCubit() : super(InitialHomePageState());
  int _selectedIndex = 0;
  homePage() {
    _selectedIndex = 0;
    emit(InitialHomePageState());
  }

  categoriesPage() {
    _selectedIndex = 1;
    emit(CategoriesHomePageState());
  }

  favoritePag() {
    _selectedIndex = 2;
    emit(FavoriteHomePageState());
  }

  accountPage() {
    _selectedIndex = 3;
    emit(AccountHomePageState());
  }

  get getIndex {
    return _selectedIndex;
  }
}
