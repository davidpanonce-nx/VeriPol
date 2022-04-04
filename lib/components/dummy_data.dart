class DummyData {
  DummyData();

  final List<Map<String, dynamic>> nationalRoles = [
    {
      "topic-number": 1,
      "topic-title": "President",
      "overall-percentage": 100,
      "modules": [
        {
          "module-number": 1,
          "module-title": "History",
          "percentage-completed": 100,
        },
        {
          "module-number": 2,
          "module-title": "Roles",
          "percentage-completed": 100,
        },
        {
          "module-number": 3,
          "module-title": "Responsibilities",
          "percentage-completed": 100,
        },
        {
          "module-number": 4,
          "module-title": "Roles and Responsibilities of the President",
          "percentage-completed": 100,
        },
      ],
    },
    {
      "topic-number": 2,
      "topic-title": "Vice President",
      "overall-percentage": 33,
      "modules": [
        {
          "module-number": 1,
          "module-title": "History",
          "percentage-completed": 100,
        },
        {
          "module-number": 2,
          "module-title": "Responsibilities",
          "percentage-completed": 0,
        },
        {
          "module-number": 3,
          "module-title": "Roles and Responsibilities of the President",
          "percentage-completed": 0,
        },
      ],
    },
    {
      "topic-number": 3,
      "topic-title": "Senator",
      "overall-percentage": 0,
      "modules": [
        {
          "module-number": 1,
          "module-title": "History",
          "percentage-completed": 0,
        },
        {
          "module-number": 2,
          "module-title": "Responsibilities",
          "percentage-completed": 0,
        },
        {
          "module-number": 3,
          "module-title": "Roles and Responsibilities of the President",
          "percentage-completed": 0,
        },
      ],
    },
    {
      "topic-number": 4,
      "topic-title": "House of Representatives",
      "overall-percentage": 0,
      "modules": [
        {
          "module-number": 1,
          "module-title": "History",
          "percentage-completed": 0,
        },
        {
          "module-number": 2,
          "module-title": "Responsibilities",
          "percentage-completed": 0,
        },
        {
          "module-number": 3,
          "module-title": "Roles and Responsibilities of the President",
          "percentage-completed": 0,
        },
      ],
    },
  ];

  final List<Map<String, dynamic>> topicCardData = [
    {
      "course-number": 1,
      "percentage-completed": 75,
      "topic-title": "Course Welcome",
      "description":
          "A Course to teach you how to use VeriPol and Learn about the Platform. Here we will introduce to you what to expect from a course in VeriPol and..."
    },
    {
      "course-number": 2,
      "percentage-completed": 0,
      "topic-title": "National Roles in the Government",
      "description":
          "In this course, you will learn more about the roles in the National Level of Government. What are the powers, responsi..."
    },
    {
      "course-number": 3,
      "percentage-completed": 0,
      "topic-title": "Legislative Process",
      "description":
          "In this course, you will learn about the seperation of government into 3 powers, Judiciary, Executive, and Legislat..."
    },
    {
      "course-number": 4,
      "percentage-completed": 0,
      "topic-title": "Legislative Process",
      "description":
          "Here you will learn about how a bill, becomes a law and build understanding on what our senators and congressmen are doing..."
    }
  ];

  final List<Map<String, dynamic>> leftOffCardData = [
    {
      "header": "Essentials",
      "lesson-length": 6,
      "current-lesson-number": 2,
      "title": "Nat'l Roles: Job of a Senator",
    },
    {
      "header": "Essentials",
      "lesson-length": 6,
      "current-lesson-number": 2,
      "title": "Voters Education 101: Boto ay Huwag ibenta",
    },
    {
      "header": "Essentials",
      "lesson-length": 6,
      "current-lesson-number": 2,
      "title": "National Positions: Job of a Senator",
    },
  ];

  final List<Map<String, dynamic>> articleData = [
    {
      "header": "Intro",
      "article-length-time": 10,
      "article-title": "From the Founder: Hello! How is your ex...",
      "article-description":
          "Read about the founders of VeriPol. We developed this application to solve a personal problem of ours and...",
    },
    {
      "header": "Natonal Positions in the Phillipines",
      "article-length-time": 10,
      "article-title": "The Salary of a President",
      "article-description":
          "Do you know how much a President is paid? How about a Senator? Well, according to this it is...",
    },
    {
      "header": "Natonal Positions in the Phillipines",
      "article-length-time": 10,
      "article-title": "Senatorial Aspirants",
      "article-description":
          "In this article we discuss what we've learned about the senatorial aspirants through our own research and from ABS-CBN...",
    },
    {
      "header": "Natonal Positions in the Phillipines",
      "article-length-time": 10,
      "article-title": "Future of Veripol",
      "article-description":
          "Here we discuss our timeline and what we believe could be the future of this application...",
    },
  ];
}
