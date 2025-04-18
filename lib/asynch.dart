void main(){
  List<String> books=["Galibers Travels","Dr jekil and mr hide","number2","number2"];
  Set<String> bags={"bag1","bag2"};
  for(var bag in bags){
    if (bag == "bag1"){
      print(bag);
    }else{
      print("itz may be bag2");
      print("its new massgae");
    }
  }
}