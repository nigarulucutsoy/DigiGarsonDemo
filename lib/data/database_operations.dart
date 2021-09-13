import 'package:digigarson_demo/models/customer_users.dart';
import 'package:digigarson_demo/models/product_categories.dart';
import 'package:digigarson_demo/models/products.dart';
import 'package:mysql1/mysql1.dart';
class DatabaseOperations {
  final String _host = '45.144.154.89';
  final int _port = 3306;
  final String _user = "test_pos_app";
  final String _password = "S6zKyjCQlIobBCVEly0XCG7tD5zyfT!T!7!dhYw5m7Euf@X@OcgGqen^8!m0H%9A";
  final String _db = "test_pos_app";

  DatabaseOperations();

  Future<List<CustomerUsers>> listDataForCustomerUsers() async {
    try {
      final connection = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      List<CustomerUsers> list = [];
      var dataList =
      await connection.query('select * from customer_users');
      for (var item in dataList) {
        list.add(
          CustomerUsers(
            item["id"],
            item["name"],
            item["create_date"],
            item["email"],
            item["email_confirm_code"],
            item["phone"],
            item["phone_confirm_code"],
            item["address_id"],
            item["language_id"],
          ),
        );
      }
      return list;
    } catch (e) {
      List<CustomerUsers> error = [];
      error.add(
        CustomerUsers(
          1,
          "merve",
          "",
          "",
          "",
          "",
          "",
          1,
          1,
        ),
      );
      return error;
    }
  }

  Future<List<ProductCategories>> listDataForProductCategories() async {
    try {
      final connection = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      List<ProductCategories> list = [];
      var dataList =
      await connection.query('select * from product_categories where branch_id=3');
      for (var item in dataList) {
        list.add(
          ProductCategories(
            item["id"],
            item["branch_id"],
            item["main_id"],
            item["rank"],
            item["start_time"],
            item["end_time"],
            item["active_table"],
            item["active_take_away"],
            item["active_safe"],
            item["active_come_take"],
            item["product_id"],
            item["name_tr"],
            item["name_en"],
            item["name_nl"],
            item["name_de"],
            item["name_ar"],
            item["name_ru"],
            item["name_zh"],
            item["name_sp"],
            item["name_it"],
            item["name_pt"],
            item["name_ro"],
            item["name_fr"],
            item["is_delete"],
          ),
        );
      }
      return list;
    } catch (e) {
      List<ProductCategories> error = [];
      error.add(
        ProductCategories(
          1,
          1,
          1,
          1,
          "merve",
          "merve",
          1,
          1,
          1,
          1,
          1,
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          1,
        ),
      );
      return error;
    }
  }

  Future<List<Products>> listDataForProducts(int categoryId) async {
    try {
      final connection = await MySqlConnection.connect(
        ConnectionSettings(
            host: _host,
            port: _port,
            user: _user,
            password: _password,
            db: _db),
      );

      List<Products> list = [];
      var dataList =
      await connection.query('select * from products where category_id=$categoryId');
      for (var item in dataList) {
        list.add(
          Products(
            item["id"],
            item["branch_id"],
            item["code"],
            item["rank"],
            item["category_id"],
            item["quantity_id"],
            item["image"],
            item["create_date"],
            item["start_time"],
            item["end_time"],
            item["is_delete"],
            item["delete_date"],
            item["delete_ip"],
            item["price"],
            item["price_safe"],
            item["price_take_away"],
            item["price_come_take"],
            item["price_personal"],
            item["price_other"],
            item["vat"],
            item["vat_safe"],
            item["vat_take_away"],
            item["vat_come_take"],
            item["vat_personel"],
            item["vat_other"],
            item["favorite"],
            item["active_pos"],
            item["active_mobile"],
            item["active_take_away"],
            item["active_come_take"],
            item["name_tr"],
            item["name_en"],
            item["name_nl"],
            item["name_de"],
            item["name_ar"],
            item["name_ru"],
            item["name_zh"],
            item["name_sp"],
            item["name_it"],
            item["name_pt"],
            item["name_ro"],
            item["name_fr"],
            item["comment_en"],
            item["comment_nl"],
            item["comment_de"],
            item["comment_ar"],
            item["comment_ru"],
            item["comment_zh"],
            item["comment_sp"],
            item["comment_it"],
            item["comment_pt"],
            item["comment_ro"],
            item["comment_tr"],
            item["comment_fr"],
          ),
        );
      }
      return list;
    } catch (e) {
      List<Products> error = [];
      error.add(
        Products(
          1,
          1,
          "merve",
          1,
          1,
          1,
          "merve",
          "merve",
          "merve",
          "merve",
          1,
          "merve",
          "merve",
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
        ),
      );
      return error;
    }
  }


}