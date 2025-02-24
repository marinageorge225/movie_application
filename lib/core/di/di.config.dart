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
import '../../repository/register/data_source/register_remote_data_source.dart'
    as _i1059;
import '../../repository/register/data_source/register_remote_data_source_impl.dart'
    as _i849;
import '../../repository/register/repository/register_repository.dart' as _i252;
import '../../repository/register/repository/register_repository_impl.dart'
    as _i1049;
import '../../repository/reset_password/data_source/reset_password_remote_data_source.dart'
    as _i679;
import '../../repository/reset_password/data_source/reset_password_remote_data_source_impl.dart'
    as _i990;
import '../../repository/reset_password/repository/reset_password_repository.dart'
    as _i192;
import '../../repository/reset_password/repository/reset_password_repository_impl.dart'
    as _i910;
import '../../repository/update_profile_repository/data_sources/update_profile_remote_data_source.dart'
    as _i808;
import '../../repository/update_profile_repository/data_sources/update_profile_remote_data_source_impl.dart'
    as _i442;
import '../../repository/update_profile_repository/repository/update_profile_repository.dart'
    as _i942;
import '../../repository/update_profile_repository/repository/update_profile_repository_impl.dart'
    as _i961;
import '../../repository/watch_list/dataSources/watch_list_remote_data_source.dart'
    as _i446;
import '../../repository/watch_list/dataSources/watch_list_remote_data_source_impl.dart'
    as _i376;
import '../../repository/watch_list/repository/watch_List_repository.dart'
    as _i821;
import '../../repository/watch_list/repository/watch_list_repository_impl.dart'
    as _i206;
import '../../ui/auth/forget_password/cubit/reset_password_view_model.dart'
    as _i28;
import '../../ui/auth/login/login_view_model.dart' as _i544;
import '../../ui/auth/Reigster/cubit/register_view_model.dart' as _i663;
import '../../ui/home_screen/tabs/browse_tab/cubit/browse_tab_view_model.dart'
    as _i731;
import '../../ui/home_screen/tabs/home_tab/cubit/home_tap_view_model.dart'
    as _i368;
import '../../ui/home_screen/tabs/profile/update_profile/cubit/update_profile_view_model.dart'
    as _i554;
import '../../ui/home_screen/tabs/profile/watch_list/cubit/watch_list_view_model.dart'
    as _i772;
import '../../ui/see_more/cubit/see_more_view_model.dart' as _i933;
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
    gh.factory<_i808.UpdateProfileRemoteDataSource>(() =>
        _i442.UpdateProfileRemoteDataSourceImpl(
            apiManager: gh<_i339.ApiManager>()));
    gh.factory<_i1044.LoginRemoteDataSource>(() =>
        _i415.LoginRemoteDataSourceImpl(apiManager: gh<_i339.ApiManager>()));
    gh.factory<_i415.LoginRepository>(() => _i773.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i1044.LoginRemoteDataSource>()));
    gh.factory<_i446.WatchListRemoteDataSource>(() =>
        _i376.WatchListRemoteDataSourceImpl(
            apiManager: gh<_i339.ApiManager>()));
    gh.factory<_i1059.RegisterRemoteDataSource>(() =>
        _i849.RegisterRemoteDataSourceImpl(apiManager: gh<_i339.ApiManager>()));
    gh.factory<_i679.ResetPasswordRemoteDataSource>(() =>
        _i990.ResetPasswordRemoteDataSourceImpl(
            apiManager: gh<_i339.ApiManager>()));
    gh.factory<_i176.MovieListRepository>(() => _i1012.MovieListRepositoryImpl(
        remoteDataSource: gh<_i711.MovieListRemoteDataSource>()));
    gh.factory<_i942.UpdateProfileRepository>(() =>
        _i961.UpdateProfileRepositoryImpl(
            remoteDataSource: gh<_i808.UpdateProfileRemoteDataSource>()));
    gh.factory<_i252.RegisterRepository>(() => _i1049.RegisterRepositoryImpl(
        registerRemoteDataSource: gh<_i1059.RegisterRemoteDataSource>()));
    gh.factory<_i821.WatchListRepository>(() => _i206.WatchListRepositoryImpl(
        remoteDataSource: gh<_i446.WatchListRemoteDataSource>()));
    gh.factory<_i544.LoginViewModel>(
        () => _i544.LoginViewModel(gh<_i415.LoginRepository>()));
    gh.factory<_i192.ResetPasswordRepository>(() =>
        _i910.ResetPasswordRepositoryImpl(
            resetPasswordRemoteDataSource:
                gh<_i679.ResetPasswordRemoteDataSource>()));
    gh.factory<_i663.RegisterCubit>(
        () => _i663.RegisterCubit(gh<_i252.RegisterRepository>()));
    gh.factory<_i28.ResetPasswordViewModel>(() => _i28.ResetPasswordViewModel(
        resetPasswordRepository: gh<_i192.ResetPasswordRepository>()));
    gh.factory<_i731.BrowseTabViewModel>(() => _i731.BrowseTabViewModel(
        movieListRepository: gh<_i176.MovieListRepository>()));
    gh.factory<_i368.HomeTabViewModel>(() => _i368.HomeTabViewModel(
        movieListRepository: gh<_i176.MovieListRepository>()));
    gh.factory<_i933.SeeMoreViewModel>(() => _i933.SeeMoreViewModel(
        movieListRepository: gh<_i176.MovieListRepository>()));
    gh.factory<_i554.UpdateProfileViewModel>(() => _i554.UpdateProfileViewModel(
        updateProfileRepository: gh<_i942.UpdateProfileRepository>()));
    gh.factory<_i772.WatchListCubit>(() =>
        _i772.WatchListCubit(repository: gh<_i821.WatchListRepository>()));
    return this;
  }
}
