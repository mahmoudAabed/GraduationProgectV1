class Activity{
  late String name ,image;
 late String description;
late int cost;
   Activity(this.name,this.image,this.description,this.cost);

  Activity.fromJson(Map<dynamic,dynamic>map)
  {
    if (map==null)
      return;
    else
    {
      name=map['name'];
      image=map['image'];
      description=map['description'];
      cost=map['cost'];
       }
  }//end fromJson

  toJson()
  {
    return{
      'name':name,
      'image':image,
      'description':description,
      'cost':cost,
      };
  }
}