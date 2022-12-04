import 'package:dio/dio.dart';
import 'package:dooking/data/models/reg_body.dart';
import 'package:dooking/data/models/token_request.dart';
import 'package:retrofit/retrofit.dart';

import '../models/parent.dart';
import '../models/child.dart';
import '../models/token_set.dart';

part 'rest_client.g.dart';


@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  // @GET("/parent/{parentId}")
  // Future<Parent> getParent(@Path("parentId") String parentId);

  @GET("/child/{childId}")
  Future<Child> getChild(@Path("childId") String childId);
  
  @GET('/profile/parent')
  Future<Parent> getParent();

  @POST("/auth")
  Future<TokenSet> auth(@Body() TokenRequest tokenRequest);

  @POST("/auth/signUp")
  Future<TokenSet> reg(@Body() RegBody regBody);

  @PUT("/profile/parent")
  Future<void> saveParentProfile(@Body() Parent parent);
}