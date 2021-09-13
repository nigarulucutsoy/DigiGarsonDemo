//@dart=2.9

import 'package:digigarson_demo/models/product_categories.dart';
import 'package:digigarson_demo/screens/products_for_categories.dart';
import '../data/database_operations.dart';
import 'package:flutter/material.dart';


class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<ProductCategories> productCategoriesList=[];
  List<ProductCategories> productList=[];
  DatabaseOperations databaseOperations;
  void listData() async{
    databaseOperations=new DatabaseOperations();
    productCategoriesList=await databaseOperations.listDataForProductCategories();
    setState(() {
      productList=productCategoriesList;
    });
  }
  @override
  void initState(){
    listData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(1),
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      crossAxisCount: 2,

      children: List.generate(productList.length, (index){
        return categoryCard(productList[index].name_tr,productList[index].id);
      }),
    );
  }

  Widget categoryCard(String categoryName,int categoryId) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsForCategories(categoryName,categoryId)));
      },
      child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  height: 140.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/02/05/15/34/pasta-1181189_960_720.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  categoryName,
                  style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4.0,
                  spreadRadius:
                  2.0, //yayılma yarıçapı, bu değer ne kadar artarsa gölge de o kadar geniş bir alana yayılır.
                ),
              ],
            ),
          ),
    );
  }

}






