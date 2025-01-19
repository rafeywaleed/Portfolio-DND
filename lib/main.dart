import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/ExoTechStudio.png",
              height: screenHeight / 3,
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.32,
            maxChildSize: 0.90,
            initialChildSize: 0.35,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: screenWidth * 0.08,
                            backgroundImage: AssetImage('assets/Rafey.jpg'),
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abdul Rafey Waleed',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.06,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                'Flutter Developer, UI/UX Designer',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black26),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: SectionTitle(title: 'About Me'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: SectionContent(
                        content:
                            'I am a Flutter Developer with a passion for building beautiful, responsive apps for mobile and web.',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: SectionTitle(title: 'Projects'),
                    ),
                    CustomCard(
                      title: 'KindMap',
                      description:
                          'Be Kind and Help the people nearby in few easy steps',
                      imageUrl: 'KindMap.png',
                      projectUrl: 'https://github.com/rafeywaleed/KindMap',
                    ),
                    CustomCard(
                      title: 'Nova Day',
                      description:
                          'Build habits, Manage Tasks, and Track your progress.',
                      imageUrl: 'NovaDay.png',
                      projectUrl:
                          'https://play.google.com/store/apps/details?id=com.hundred_days.app',
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: SectionTitle(title: 'Experience'),
                    ),
                    CustomCard(
                      title: 'Flutter Developer',
                      description: 'Developed cross-platform applications.',
                      imageUrl: "null",
                      projectUrl: "null",
                    ),
                    CustomCard(
                      title: 'UI/UX Designer',
                      description:
                          'Designed intuitive and user-friendly interfaces.',
                      imageUrl: "null",
                      projectUrl: "null",
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: SectionTitle(title: 'Download/View CV'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          const url =
                              'https://drive.google.com/file/d/1MbNKDYFY8cYnEJb68v4gXgtikVc4lYAs/view?usp=sharing';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Download CV',
                            style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: SectionTitle(title: 'Social Media'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SocialMediaIcon(
                            icon: FontAwesomeIcons.linkedin,
                            url:
                                'https://www.linkedin.com/in/abdul-rafey-waleed-516052282/',
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          SocialMediaIcon(
                            icon: FontAwesomeIcons.github,
                            url: 'https://github.com/rafeywaleed/',
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          SocialMediaIcon(
                            icon: FontAwesomeIcons.xTwitter,
                            url: 'https://twitter.com/your-profile',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      title,
      style: TextStyle(
        fontSize: screenWidth * 0.055,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;
  SectionContent({required this.content});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      content,
      style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.black87),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String projectUrl;

  CustomCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectUrl,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (projectUrl != "null") {
          launch(projectUrl);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Row(
            children: [
              if (imageUrl != "null")
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/$imageUrl",
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  SocialMediaIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: MediaQuery.of(context).size.width * 0.07),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
