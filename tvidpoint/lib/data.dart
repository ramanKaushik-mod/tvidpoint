class SliderModel {
  String imagePath, title, description;
  SliderModel(
      {required this.imagePath,
      required this.title,
      required this.description});

  //getters
  String getImagePath() {
    return this.imagePath;
  }

  String getTitle() {
    return this.title;
  }

  String getDesc() {
    return this.description;
  }
}

List<SliderModel> getSlide() {
  List<SliderModel> list = [];
  SliderModel slide = SliderModel(
      imagePath: "assets\\welcome_coders.png",
      title: "Welcome Coders",
      description: "");
  list.add(slide);
  slide = SliderModel(
      imagePath: "assets\\no_ads.png",
      title: "No Disturbance",
      description: "Add Free Experience");
  list.add(slide);
  slide = SliderModel(
      imagePath: "assets\\youtube.png",
      title: "Top Youtube Tutorials",
      description: "Get the best from YouTube.");
  list.add(slide);
  return list;
}
