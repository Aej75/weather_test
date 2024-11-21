import 'package:quantum_fetch/quantum_fetch.dart';
import 'package:quantum_fetch/src/metadata/pagination_meta_data.dart';
import 'package:weather_app_ajaya/core/constants/app_const.dart';

class MyFetchConfig implements QuantumFetchConfig {
  @override
  String get baseUrl => AppConst.baseUrl;
  @override
  String tokenPrefix = 'Bearer ';
  @override
  Future<String?> get token => Future.value('');
  @override
  List<Interceptor> get interceptors => [];

  @override
  int connectTimeout = 8000;

  @override
  String contentType = "application/json";

  @override
  Map<String, String> get headers => {"myheader": "myheadervalue"};

  @override
  JsonResponseNode successNode = JsonResponseNode(null);

  @override
  JsonResponseNode get dataNode => JsonResponseNode(null);

  @override
  PaginationMetaData get paginationMetaData => PaginationMetaData(
        rooteNode: "pagination",
        perPageNode: "limit",
        totalNode: "totalItems",
        currentPageNode: "page",
      );
  @override
  int get receiveTimeout => 20000;
}

class WeatherAppClient extends QuantumFetchImpl {
  final MyFetchConfig conf;
  WeatherAppClient(this.conf) : super(conf);
}
