import 'package:food_delivery_app/data/api/api_models/Register_model.dart';
import 'package:food_delivery_app/data/api/api_models/login_model.dart';
import 'package:food_delivery_app/data/api/api_models/user_details_model.dart';
import 'package:food_delivery_app/data/api/api_models/vendor_details_model.dart';
import 'package:food_delivery_app/data/api/api_requests/pagination_request.dart';
import 'package:food_delivery_app/data/api/api_requests/register_request.dart';
import 'package:food_delivery_app/data/api/list_page.dart';
import 'package:food_delivery_app/data/models/product.dart';
import 'package:food_delivery_app/data/models/product_data_model.dart';
import '../api/api_response.dart';

abstract class AppDataSource{

  Future<ApiResponse<RegisterModel>> register(RegisterRequest request);

  Future<ApiResponse<LoginModel>> login(RegisterRequest request);

  Future<ApiResponse<List<ProductDataModel>>> homeData();

  Future<ApiResponse<LoginModel>> logout(RegisterRequest request);

  Future<ApiResponse<ListPage<Product>>> seeAllList(PaginationRequest request);

  Future<ApiResponse<UserDetailsModel>> getUserDetails(RegisterRequest request);

  Future<ApiResponse<VendorDetailsModel>> vendorDetails(PaginationRequest request);

}