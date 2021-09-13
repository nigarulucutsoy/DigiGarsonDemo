//@dart=2.9
import 'package:digigarson_demo/models/product_categories.dart';
import 'package:digigarson_demo/models/products.dart';
import 'package:digigarson_demo/screens/product_detail.dart';
import '../data/database_operations.dart';
import 'package:flutter/material.dart';

class ProductsForCategories extends StatefulWidget {
  int categoryId;
  String categoryName;
  ProductsForCategories(this.categoryName,this.categoryId);
  @override
  _ProductsForCategoriesState createState() => _ProductsForCategoriesState();
}

class _ProductsForCategoriesState extends State<ProductsForCategories> {

  List<Products> products=[];
  List<Products> productsList=[];
  DatabaseOperations databaseOperations;
  void listData() async{
    databaseOperations=new DatabaseOperations();
    products=await databaseOperations.listDataForProducts(widget.categoryId);
    setState(() {
      productsList=products;
    });
  }
  @override
  void initState(){
    super.initState();
    listData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[400],
        ),
        backgroundColor: Colors.white,
        elevation: 15.0,
        title: Text(
          widget.categoryName,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.red[400],
          ),
        ),
      ),
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: List.generate(productsList.length, (index){
            return productCard(productsList[index].id,productsList[index].image,productsList[index].name_tr,productsList[index].price,productsList[index].comment_tr);
          }),
      ),
    );
  }

  Widget productCard(int productId,String image,String productName,double productPrice,String comment) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(productId,image,productName,productPrice,comment)));
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 130.0,
              height: 90.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              productName,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
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

