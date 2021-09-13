class Cart{
  var productId;
  var productName;
  var productImage;
  var quantity;
  var productPrice;
  Cart.withindata();
  Cart(this.productId, this.productName, this.productImage,this.quantity,this.productPrice);

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();  //bellekte bir tane map nesnesi oluşturuyoruz.
    map["productId"]=productId;
    map["productName"]=productName;
    map["productImage"]=productImage;
    map["quantity"]=quantity;
    map["productPrice"]=productPrice;
    return map;
  }
  Cart.fromObject(dynamic obj){
    this.productId=obj["productId"];
    this.productName=obj["productName"];
    this.productImage=obj["productImage"];
    this.quantity=obj["quantity"];
    this.productPrice=obj["productPrice"];
  }
}
