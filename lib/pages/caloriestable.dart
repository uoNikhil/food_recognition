Map<String,String> calories_table = {"Apple": "52", "Banana":"89", "Orange":"47", "donut":"200", "Grapefruit":"42"};

String getCals(String? item)
{
  if(item == null)
    return "cant determine";
  String? cals = calories_table[item];
  if(cals!=null)
    return cals;
  return "cant determine";
}