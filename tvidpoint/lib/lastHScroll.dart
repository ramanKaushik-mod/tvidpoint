class LastHScroll {
  late String title;
  late String description;
  late String imageUrl;

  setTitle(String title) {
    this.title = title;
  }

  setDesc(String desc) {
    description = desc;
  }

  setImage(String url) {
    imageUrl = url;
  }
}

List<LastHScroll> getLScrollList() {
  List<LastHScroll> list = [];
  LastHScroll details = LastHScroll();
  details.setTitle("JAVA");
  details.setDesc(
      "Java is extremely versatile meaning it can be used across platforms. ... Java's popular tag lines says “right once and run anywhere” that means Java bytecodes can be run on any hardware. Put simply, it means an app created in Windows environment can easily run on any other platform.");
  details.setImage("assets\\javaPNG2.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("KOTLIN");
  details.setDesc(
      "Kotlin enables the prevention of the occurrence of common programming errors by design, which results in fewer system failures and application crashes. When developers write any code in Java, they are likely to make errors. But when it comes to Kotlin, it pushes developers to write robust code.");
  details.setImage("assets\\kotlinPNG.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("JAVASCRIPT");
  details.setDesc(
      "JavaScript has emerged are more versatile programming language than Java. It was due to many reasons — continuous development, backend usage, multiple domain growth, ease of use, efficiency, tools etc.");
  details.setImage("assets\\JavaScript.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("PYTHON");
  details.setDesc(
      "Python is a preferred high-level, server-side programming language for websites and mobile apps. For both, new and old developers, Python has managed to stay a language of choice with ease. Due to its readability and dense syntax, developers can express a concept with more ease than they can, using other languages.");
  details.setImage("assets\\pythonPng.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("DATA STRUCTURE");
  details.setDesc(
      "Python is a preferred high-level, server-side programming language for websites and mobile apps. For both, new and old developers, Python has managed to stay a language of choice with ease. Due to its readability and dense syntax, developers can express a concept with more ease than they can, using other languages.");
  details.setImage("assets\\DSPNG.png");
  return list;
}

List<LastHScroll> getLSScrollList() {
  List<LastHScroll> list = [];
  LastHScroll details = LastHScroll();
  details.setTitle("JAVA");
  details.setDesc(
      "Java is everywhere. Java is estimated to be running on over 3 billion. devices worldwide.");
  details.setImage("assets\\flutterPNG.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("JAVA");
  details.setDesc(
      "Java is everywhere. Java is estimated to be running on over 3 billion. devices worldwide.");
  details.setImage("assets\\flutterPNG.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("JAVA");
  details.setDesc(
      "Java is everywhere. Java is estimated to be running on over 3 billion. devices worldwide.");
  details.setImage("assets\\javaPNG2.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("JAVA");
  details.setDesc(
      "Java is everywhere. Java is estimated to be running on over 3 billion. devices worldwide.");
  details.setImage("assets\\javaPNG2.png");
  list.add(details);
  return list;
}

List<LastHScroll> getFScrollList() {
  List<LastHScroll> list = [];
  LastHScroll details = LastHScroll();
  details.setTitle("Flutter");
  details.setDesc(
      "Flutter framework opens doorways to cross-platform improvement surroundings. For this reason, very quickly human beings would want emigrate to a greater versatile platform, subsequently Flutter would upward thrust to glory.");
  details.setImage("assets\\flutterPNG.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("Data Science");
  details.setDesc(
      "The future scope of data science is very high due to the outcomes and growth it has shown recently. It will be observed in the near future that new data science paradigms will emerge and the data scientists will be able to use all kinds of data in real-time.");
  details.setImage("assets\\Data_Science_Lifecycle_blue.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("Python");
  details.setDesc(
      "The future scope of python programming language also depends on its competitors in the IT market. But, due to the fact that it has become a core language for future technologies such as artificial intelligence, big data, etc., it will surely gonna rise further and will be able to beat its competitors.");
  details.setImage("assets\\pythonPng.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("JSON");
  details.setDesc(
      "JSON is a language-independent data format. It was derived from JavaScript, but many modern programming languages include code to generate and parse JSON-format data. The official Internet media type for JSON is application/json. JSON filenames use the extension .json .");
  details.setImage("assets\\json.png");
  list.add(details);
  details = LastHScroll();
  details.setTitle("Data Structure");
  details.setDesc(
      "A data structure is a particular way of organizing data in a computer so that it can be used efficiently. Data structures can implement one or more particular abstract data types (ADT), which are the means of specifying the contract of operations and their complexity.");
  details.setImage("assets\\DSPNG.png");
  list.add(details);
  return list;
}
