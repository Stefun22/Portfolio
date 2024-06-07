import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_stefun_1/main.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pgCont = PageController(initialPage: 0, viewportFraction: 0.3);
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pgCont.position.atEdge) {
        pgCont.animateTo(1,
            duration: const Duration(seconds: 3), curve: Curves.easeInOutExpo);
      } else {
        pgCont.nextPage(
            duration: const Duration(seconds: 3), curve: Curves.easeInOutExpo);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              image: AssetImage("assets/sample 2.png"))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Scaffold(
          appBar: NavBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome to My Portfolio',
                          style: TextStyle(
                              fontSize: 30.adjust(),
                              color: Colors.pink,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: Sizes.width * 0.02),
                      Text('Personal Introduction : ',
                          style: TextStyle(
                              fontSize: 22.adjust(),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: Sizes.width * 0.01),
                      Text(
                        '   Hi, I\'m Jabaseelan, a passionate Flutter developer with a keen eye for detail and a strong commitment to creating high-quality mobile applications. With a background in computer science and over 3 years of professional experience, I specialize in building cross-platform apps that are both functional and visually appealing.',
                        style: TextStyle(fontSize: 18.adjust()),
                      ),
                      SizedBox(height: Sizes.width * 0.02),
                      Text('Professional Summary : ',
                          style: TextStyle(
                              fontSize: 22.adjust(),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: Sizes.width * 0.01),
                      Text(
                        "As a dedicated Flutter developer, I have worked on a variety of projects ranging from small startups to large-scale enterprises. My expertise lies in leveraging the full potential of the Flutter framework to deliver seamless user experiences on both iOS and Android platforms. I thrive in collaborative environments and am always eager to tackle new challenges and stay updated with the latest industry trends.",
                        style: TextStyle(fontSize: 18.adjust()),
                      ),
                      SizedBox(height: Sizes.width * 0.02),
                      Text('Technical Skills : ',
                          style: TextStyle(
                              fontSize: 22.adjust(),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: Sizes.width * 0.01),
                      SizedBox(
                        width: Sizes.width,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 22.adjust(),
                          spacing: 22.adjust(),
                          children: skillsSetData
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: HoverCard(
                                    child: SizedBox(
                                      width: Sizes.width / 4.6,
                                      height: Sizes.width / 5,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.adjust(),
                                            3.adjust(),
                                            10.adjust(),
                                            3.adjust()),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: Sizes.width * 0.01),
                                              Text(
                                                e["name"]!,
                                                style: TextStyle(
                                                    fontSize: 16.adjust()),
                                              ),
                                              SizedBox(
                                                  height: Sizes.width * 0.01),
                                              Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  height: Sizes.width / 10,
                                                  width: Sizes.width / 10,
                                                  child: Image.network(
                                                      e["image"]!),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: Sizes.width * 0.01),
                                              Text(
                                                e["data"]!,
                                                style: TextStyle(
                                                    fontSize: 12.adjust()),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(height: Sizes.width * 0.02),
                      SizedBox(
                        // width: Sizes.width,
                        height: Sizes.width / 3.8,
                        child: PageView.builder(
                            controller: pgCont,
                            scrollDirection: Axis.horizontal,
                            itemCount: technical_skills.length,
                            // allowImplicitScrolling: true,
                            itemBuilder: (ctx, ind) {
                              Map<String, dynamic> e = technical_skills[ind];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          width: Sizes.width / 3.5,
                                          // height: Sizes.width / 5,
                                          child: Column(children: [
                                            SizedBox(
                                                height: Sizes.width * 0.01),
                                            Text('${e["category"]} : ',
                                                style: TextStyle(
                                                    fontSize: 22.adjust(),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                                height: Sizes.width * 0.01),
                                            ...e["skills"]
                                                .map((ee) => ListTile(
                                                      leading: MyBullet(),
                                                      titleAlignment:
                                                          ListTileTitleAlignment
                                                              .center,
                                                      title: Text(
                                                        ee,
                                                        style: TextStyle(
                                                            fontSize:
                                                                18.adjust(),
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.8)),
                                                      ),
                                                    ))
                                                .toList(),
                                            SizedBox(height: Sizes.width * 0.01)
                                          ]),
                                        )),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: Sizes.width * 0.02),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> technical_skills = [
    {
      "category": "Programming Languages",
      "skills": ["Python", "Java", "Dart", "HTML", "CSS"]
    },
    {
      "category": "Frameworks",
      "skills": ["Flutter", "Spring Boot"]
    },
    {
      "category": "Database",
      "skills": ["SQL (Structured Query Language)", "Firebase"]
    },
    {
      "category": "Tools & Technologies",
      "skills": ["Git", "GitHub", "Postman", "VS Code", "Android Studio"]
    }
  ];

// soft_skills = [
  final List<Map<String, String>> skillsSetData = [
    {
      "name": "Flutter",
      "data":
          "Proficient in using Flutter for developing responsive and intuitive mobile applications.",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/2048px-Flutter_logo.svg.png",
    },
    {
      "name": "Firebase Authentication",
      "data":
          "Experienced in implementing secure user authentication and authorization mechanisms using Firebase Authentication.",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Firebase_icon.svg/2048px-Firebase_icon.svg.png",
    },
    {
      "name": "Cloud Firestore",
      "data":
          "Skilled in utilizing Firestore for real-time database management and data synchronization.",
      "image":
          "https://static-00.iconduck.com/assets.00/file-type-firestore-icon-1780x2048-0rzupks3.png",
    },
    {
      "name": "Push Notifications",
      "data":
          "Proficient in integrating push notifications using Firebase Cloud Messaging (FCM) to enhance user engagement.",
      "image": "https://cdn-icons-png.flaticon.com/512/8297/8297354.png"
    },
    {
      "name": "Jitsi Integration",
      "data":
          "Experienced in integrating Jitsi for seamless video conferencing capabilities within mobile applications.",
      "image":
          "https://cdn.icon-icons.com/icons2/1381/PNG/512/jitsi_94722.png  ",
    },
    {
      "name": "State Management",
      "data": "Expertise in state management solutions like Getx, and Bloc.",
      "image":
          "https://raw.githubusercontent.com/felangel/bloc/master/assets/logos/bloc.png",
    },
    {
      "name": "API Integration",
      "data":
          "Proficient in integrating RESTful APIs and third-party services to enhance app functionality.",
      "image": "https://cdn-icons-png.flaticon.com/512/10169/10169724.png",
    },
    {
      "name": "UI/UX Design",
      "data":
          "Adept at designing user-friendly interfaces and ensuring a seamless user experience.",
      "image":
          "https://miro.medium.com/v2/resize:fit:564/0*0P6qXDT9vA50Pl_c.jpg",
    }
  ];
}

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({Key? key, required this.child}) : super(key: key);

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: _isHovered ? Colors.white : Colors.transparent, width: 3),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.transparent.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1a043a), Colors.white],
        ),
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
