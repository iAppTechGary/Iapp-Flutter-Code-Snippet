import 'package:food_delivery_app/data/api/api_models/Register_model.dart';
import 'package:food_delivery_app/data/api/api_models/login_model.dart';
import 'package:food_delivery_app/data/api/api_models/see_all_list_model.dart';
import 'package:food_delivery_app/data/api/api_models/user_details_model.dart';
import 'package:food_delivery_app/data/api/api_models/vendor_details_model.dart';
import 'package:food_delivery_app/data/api/api_requests/pagination_request.dart';
import 'package:food_delivery_app/data/api/api_requests/register_request.dart';
import 'package:food_delivery_app/data/api/api_response.dart';
import 'package:food_delivery_app/data/api/list_page.dart';
import 'package:food_delivery_app/data/app/app_data%20_source.dart';
import 'package:food_delivery_app/data/models/product.dart';
import 'package:food_delivery_app/data/models/product_data_model.dart';

class AppRepository extends AppDataSource{

  AppDataSource appDataSource;
  AppRepository({required this.appDataSource});

  @override
  Future<ApiResponse<RegisterModel>> register(RegisterRequest request) {
    return appDataSource.register(request);
  }

  @override
  Future<ApiResponse<LoginModel>> login(RegisterRequest request) {
    return appDataSource.login(request);
  }

  @override
  Future<ApiResponse<List<ProductDataModel>>> homeData() {
    return appDataSource.homeData();
  }

  @override
  Future<ApiResponse<LoginModel>> logout(RegisterRequest request) {
    return appDataSource.logout(request);
  }

  @override
  Future<ApiResponse<ListPage<Product>>> seeAllList(PaginationRequest request) {
    return appDataSource.seeAllList(request);
  }

  @override
  Future<ApiResponse<UserDetailsModel>> getUserDetails(RegisterRequest request) {
    return appDataSource.getUserDetails(request);
  }

  @override
  Future<ApiResponse<VendorDetailsModel>> vendorDetails(PaginationRequest request) {
    return appDataSource.vendorDetails(request);
  }

}