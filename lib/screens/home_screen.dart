import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_stefun_1/constants.dart';
import 'package:portfolio_stefun_1/main.dart';

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
    return PopScope(
      canPop: false,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
                image: MemoryImage(base64.decode(Constants.bgimagesample)))),
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
                        LayoutBuilder(builder: (ctx, c) {
                          if (c.maxWidth < 900) {
                            return Container(
                              alignment: Alignment.center,
                              width: Sizes.width,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runSpacing: 22.adjust(),
                                spacing: 22.adjust(),
                                children: Constants.skillsSetData
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: HoverCard(
                                          child: Container(
                                            width: Sizes.width / 2,
                                            height: Sizes.width / 2,
                                            padding: EdgeInsets.fromLTRB(
                                                10.adjust(),
                                                3.adjust(),
                                                10.adjust(),
                                                3.adjust()),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          Sizes.width * 0.01),
                                                  Text(
                                                    e["name"]!,
                                                    style: TextStyle(
                                                        fontSize: 16.adjust()),
                                                  ),
                                                  const Spacer(),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: SizedBox(
                                                      height: Sizes.width / 5.5,
                                                      width: Sizes.width / 5.5,
                                                      child: Image.network(
                                                          e["image"]!),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    e["data"]!,
                                                    style: TextStyle(
                                                        fontSize: 16.adjust()),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          }
                          return SizedBox(
                            width: Sizes.width,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runSpacing: 22.adjust(),
                              spacing: 22.adjust(),
                              children: Constants.skillsSetData
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: HoverCard(
                                        child: SizedBox(
                                          width: Sizes.width / 4.6,
                                          height: Sizes.width / 4.6,
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
                                                      height:
                                                          Sizes.width * 0.01),
                                                  Text(
                                                    e["name"]!,
                                                    style: TextStyle(
                                                        fontSize: 16.adjust()),
                                                  ),
                                                  const Spacer(),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: SizedBox(
                                                      height: Sizes.width / 10,
                                                      width: Sizes.width / 10,
                                                      child: Image.network(
                                                          e["image"]!),
                                                    ),
                                                  ),
                                                  const Spacer(),
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
                          );
                        }),
                        SizedBox(height: Sizes.width * 0.02),
                        Text('Development Stack : ',
                            style: TextStyle(
                                fontSize: 22.adjust(),
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: Sizes.width * 0.01),
                        LayoutBuilder(builder: (context, c) {
                          if (c.maxWidth < 900) {
                            return Container(
                              width: Sizes.width,
                              alignment: Alignment.center,
                              child: Column(
                                // crossAxisAlignment: WrapCrossAlignment.start,
                                // runSpacing: 22.adjust(),
                                // spacing: 22.adjust(),
                                children: Constants.technical_skills
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10, sigmaY: 10),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: SizedBox(
                                                  width: Sizes.width / 1.5,
                                                  child: Column(children: [
                                                    SizedBox(
                                                        height:
                                                            Sizes.width * 0.01),
                                                    Text('${e["category"]} : ',
                                                        style: TextStyle(
                                                            fontSize:
                                                                22.adjust(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                        height:
                                                            Sizes.width * 0.01),
                                                    ...e["skills"]
                                                        .map((ee) => ListTile(
                                                              leading:
                                                                  MyBullet(),
                                                              titleAlignment:
                                                                  ListTileTitleAlignment
                                                                      .center,
                                                              title: Text(
                                                                ee,
                                                                style: TextStyle(
                                                                    fontSize: 18
                                                                        .adjust(),
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.8)),
                                                              ),
                                                            ))
                                                        .toList(),
                                                    SizedBox(
                                                        height:
                                                            Sizes.width * 0.01)
                                                  ]),
                                                )),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          }
                          return SizedBox(
                            // width: Sizes.width,
                            height: Sizes.width / 3.8,
                            child: PageView.builder(
                                controller: pgCont,
                                scrollDirection: Axis.horizontal,
                                itemCount: Constants.technical_skills.length,
                                // allowImplicitScrolling: true,
                                itemBuilder: (ctx, ind) {
                                  Map<String, dynamic> e =
                                      Constants.technical_skills[ind];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.1),
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
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        ))
                                                    .toList(),
                                                SizedBox(
                                                    height: Sizes.width * 0.01)
                                              ]),
                                            )),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }),
                        SizedBox(height: Sizes.width * 0.02),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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
