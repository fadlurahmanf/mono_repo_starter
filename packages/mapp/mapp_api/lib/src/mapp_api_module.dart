import 'package:core_config/config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_api/src/domain/interceptor/content_type_interceptor.dart';
import 'package:mapp_config/mapp_config.dart';
import 'package:mapp_shared/mapp_shared.dart';

class MappApiModule extends ApiModule {
  MappApiSettings settings;

  MappApiModule({required this.settings});

  @override
  Future<void> registerBaseOption(GetIt c) async {
    c
      ..registerLazySingleton<BaseOptions>(
        () => BaseOptions(
          baseUrl: '${settings.baseUrl}/identity-service/',
          connectTimeout: settings.connectTimeout,
          receiveTimeout: settings.receiveTimeout,
          sendTimeout: settings.sendTimeout,
        ),
        instanceName: MappDioConstant.IDENTITY_BASE_OPTIONS,
      )
      ..registerLazySingleton<BaseOptions>(
        () => BaseOptions(
          baseUrl: 'https://api.slingacademy.com/',
          connectTimeout: settings.connectTimeout,
          receiveTimeout: settings.receiveTimeout,
          sendTimeout: settings.sendTimeout,
        ),
        instanceName: MappDioConstant.PAGINATION_BASE_OPTIONS,
      )
      ..registerLazySingleton<BaseOptions>(
        () => BaseOptions(
          baseUrl: 'https://vc.bankmas.my.id/',
          connectTimeout: settings.connectTimeout,
          receiveTimeout: settings.receiveTimeout,
          sendTimeout: settings.sendTimeout,
        ),
        instanceName: MappDioConstant.OPENVIDU_BASE_OPTIONS,
      );
  }

  @override
  Future<void> registerDio(GetIt c) async {
    c
      ..registerLazySingleton<Dio>(
          () => abstractDio(
                c.get<BaseOptions>(instanceName: MappDioConstant.IDENTITY_BASE_OPTIONS),
                interceptors: [],
              ),
          instanceName: MappDioConstant.IDENTITY_DIO)
      ..registerLazySingleton<Dio>(
          () => abstractDio(
                c.get<BaseOptions>(instanceName: MappDioConstant.PAGINATION_BASE_OPTIONS),
                interceptors: [],
              ),
          instanceName: MappDioConstant.PAGINATION_DIO)
      ..registerLazySingleton<Dio>(
          () => abstractDio(
                c.get<BaseOptions>(instanceName: MappDioConstant.OPENVIDU_BASE_OPTIONS),
                interceptors: [],
              ),
          instanceName: MappDioConstant.OPENVIDU_DIO);
  }

  @override
  Future<void> registerApi(GetIt c) async {
    c
      ..registerLazySingleton<IIdentityApi>(() => IdentityApi(
            dio: c.get<Dio>(instanceName: MappDioConstant.IDENTITY_DIO),
          ))
      ..registerLazySingleton<IPaginationApi>(() => PaginationApi(
            dio: c.get<Dio>(instanceName: MappDioConstant.PAGINATION_DIO),
          ))
      ..registerLazySingleton<IOpenviduApi>(() => OpenviduApi(
            dio: c.get<Dio>(instanceName: MappDioConstant.OPENVIDU_DIO),
          ));
  }

  Dio abstractDio(BaseOptions options, {required List<Interceptor> interceptors}) {
    final dio = Dio();
    dio.options = options;
    dio.interceptors.add(ContentTypeInterceptor());
    dio.interceptors.addAll(interceptors);
    return dio;
  }
}
