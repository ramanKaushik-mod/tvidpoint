class MenuList {
  String listItem;
  MenuList(this.listItem);
}

List<MenuList> getMenuItems() {
  List<MenuList> list = [];
  list.add(MenuList("Java"));
  list.add(MenuList("Kotlin"));
  list.add(MenuList("Python"));
  list.add(MenuList("Github"));
  list.add(MenuList("JavaScript"));
  list.add(MenuList("Android"));
  list.add(MenuList("C++"));
  list.add(MenuList("C"));
  list.add(MenuList("HTML/CSS"));
  list.add(MenuList("Data Structure"));
  list.add(MenuList("Data Science"));
  list.add(MenuList("Maths"));
  return list;
}
