class CartActivityModel{
  late String name ,image;
   late int cost;
   CartActivityModel(this.name,this.image,this.cost);

  CartActivityModel.fromJson(Map<dynamic,dynamic>map)
  {
    if (map==null)
      return;
    else
    {
      name=map['name'];
      image=map['image'];
      cost=map['cost'];
     }
  }//end fromJson

  toJson()
  {
    return{
      'name':name,
      'image':image,
       'cost':cost,
     };
  }
}