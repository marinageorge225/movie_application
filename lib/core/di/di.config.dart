// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../repository/login/data_source/login_remote_data_source.dart'
    as _i1044;
import '../../repository/login/data_source/login_remote_data_source_impl.dart'
    as _i415;
import '../../repository/login/repository/login_repository.dart' as _i415;
import '../../repository/login/repository/login_repository_impl.dart' as _i773;
import '../../repository/movieList/dataSources/movie_list_remote_data_source.dart'
    as _i711;
import '../../repository/movieList/dataSources/movie_list_remote_data_source_impl.dart'
    as _i7;
import '../../repository/movieList/repository/movie_List_repository.dart'
    as _i176;
import '../../repository/movieList/repository/movie_list_repository_impl.dart'
    as _i1012;
import '../../ui/auth/login/login_view_model.dart' as _i544;
import '../../ui/home_screen/tabs/home_tab/cubit/home_tap_view_model.dart';
import '../api/api_manger.dart' as _i339;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i339.ApiManager>(() => _i339.ApiManager());
    gh.factory<_i711.MovieListRemoteDataSource>(() =>
        _i7.MovieListRemoteDataSourceImpl(apiManager: gh<_i339.ApiManager>()));
    gh.factory<_i1044.LoginRemoteDataSource>(() =>
        _i415.LoginRemoteDataSourceImpl(apiManager: gh<_i339.ApiManager>()));
    gh.factory<_i415.LoginRepository>(() => _i773.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i1044.LoginRemoteDataSource>()));
    gh.factory<_i176.MovieListRepository>(() => _i1012.MovieListRepositoryImpl(
        remoteDataSource: gh<_i711.MovieListRemoteDataSource>()));
    gh.factory<_i544.LoginViewModel>(
        () => _i544.LoginViewModel(gh<_i415.LoginRepository>()));
    gh.factory<HomeTabViewModel>(() =>
        HomeTabViewModel(movieListRepository: gh<_i176.MovieListRepository>()));
    return this;
  }
}
