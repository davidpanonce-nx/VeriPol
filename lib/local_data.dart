import 'models/models.dart';

List<Choice> choice1 = [
  Choice("Judicial", false),
  Choice("Extra-Judicial Killings", true),
  Choice("Executive", false),
  Choice("Legislative", false),
];
List<Choice> choice2 = [
  Choice("A deep dive into politics", false),
  Choice("How to predict the future", false),
  Choice(
      "An overview about the roles in the national scene to help you make informed decisions.",
      true),
  Choice("None of the above", false),
];
List<Choice> choice3 = [
  Choice("What does this Job actually do? (President to Senators)", false),
  Choice("What is the Legislative Branch?", false),
  Choice(
      "How do we know if an elected official is doing well or poorly?", false),
  Choice("Who will be the next President?", true),
];

List<MCQItem> mcqItems = [
  MCQItem(
      "Which is not a power according to our principle of separation of powers?",
      1,
      choice1),
  MCQItem("In this course, you will learn __________", 1, choice2),
  MCQItem(
      "Select what doesn’t belong:\n\nIn this course, We aim to answer the following questions",
      1,
      choice3)
];

TestModule testModule = TestModule("Test yourself", 80.0, null, mcqItems);
