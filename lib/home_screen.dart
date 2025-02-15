import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: const Color(0xFF1A1A1A).withOpacity(0.9),
              expandedHeight: MediaQuery.of(context).size.width < 600 ? 0 : 80,
              title: const Text(
                'R.',
                style: TextStyle(
                  color: Color(0xFF00FF66),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: MediaQuery.of(context).size.width < 600
                  ? [
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ),
                    ]
                  : [
                      TextButton(
                        onPressed: () => _scrollToSection(_homeKey),
                        child: const Text('Home',
                            style: TextStyle(color: Colors.white)),
                      ),
                      TextButton(
                        onPressed: () => _scrollToSection(_aboutKey),
                        child: const Text('About',
                            style: TextStyle(color: Colors.white)),
                      ),
                      TextButton(
                        onPressed: () => _scrollToSection(_servicesKey),
                        child: const Text('Services',
                            style: TextStyle(color: Colors.white)),
                      ),
                      TextButton(
                        onPressed: () => _scrollToSection(_contactKey),
                        child: const Text('Contact',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(width: 20),
                      _socialIcon(FontAwesomeIcons.github),
                      _socialIcon(FontAwesomeIcons.linkedin),
                      _socialIcon(FontAwesomeIcons.instagram),
                      _socialIcon(FontAwesomeIcons.twitter),
                      const SizedBox(width: 20),
                    ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(key: _homeKey, child: _buildHeroSection(context)),
                Container(key: _aboutKey, child: _buildAboutSection(context)),
                Container(key: _servicesKey, child: _buildProjectsSection(context)),
                _skillItem('Flutter', 0.9),
                _skillItem('React', 0.85),
                _skillItem('Node.js', 0.8),
                _skillItem('UI/UX Design', 0.75),
                Container(key: _contactKey, child: _buildContactSection(context)),
              ]),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: Container(
            color: const Color(0xFF1A1A1A),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A2A2A),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF00FF66),
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://placekitten.com/200/200',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Joe Greyson',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Frontend Developer',
                        style: TextStyle(
                          color: Color(0xFF00FF66),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'NAVIGATION',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                _drawerItem(
                    'Home', Icons.home, () => _scrollToSection(_homeKey)),
                _drawerItem('About', Icons.person,
                    () => _scrollToSection(_aboutKey)),
                _drawerItem('Services', Icons.design_services,
                    () => _scrollToSection(_servicesKey)),
                _drawerItem('Contact', Icons.contact_mail,
                    () => _scrollToSection(_contactKey)),
                const Divider(color: Colors.white24),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'SKILLS',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                _skillItem('Flutter', 0.9),
                _skillItem('React', 0.85),
                _skillItem('Node.js', 0.8),
                _skillItem('UI/UX Design', 0.75),
                const Divider(color: Colors.white24),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'CONNECT',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _drawerSocialButton(
                          FontAwesomeIcons.github, 'GitHub'),
                      _drawerSocialButton(
                          FontAwesomeIcons.linkedin, 'LinkedIn'),
                      _drawerSocialButton(
                          FontAwesomeIcons.twitter, 'Twitter'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    ' 2024 Joe Greyson. All rights reserved.',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );

  Widget _drawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onTap();
      },
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 50,
        vertical: isSmallScreen ? 40 : 80,
      ),
      child: Column(
        children: [
          if (isSmallScreen || isMediumScreen) _buildProfileImage(),
          const SizedBox(height: 30),
          Flex(
            direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.yellow,
                margin: EdgeInsets.only(
                    left: isSmallScreen ? 0 : screenWidth * 0.1),
                constraints: BoxConstraints(
                  maxWidth: isSmallScreen ? double.infinity : 600,
                ),
                child: Column(
                  crossAxisAlignment: isSmallScreen
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, it\'s me',
                      style: TextStyle(
                        color: const Color(0xFF00FF66),
                        fontSize: isSmallScreen ? 20 : 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'N V RAKESH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 36 : 48,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign:
                          isSmallScreen ? TextAlign.center : TextAlign.left,
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isSmallScreen ? 24 : 32,
                      ),
                      textAlign:
                          isSmallScreen ? TextAlign.center : TextAlign.left,
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: isSmallScreen
                          ? WrapAlignment.center
                          : WrapAlignment.start,
                      children: [
                        _actionButton('Let\'s Talk', true),
                        _actionButton('Portfolio', false),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isSmallScreen && !isMediumScreen)
                Container(
                  height: 500,
                  width: 500,
                  margin: EdgeInsets.only(right: screenWidth * 0.13),
                  //color: Colors.red,
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: _buildProfileImage(),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF00FF66), width: 2),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF00FF66),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ]),
      child: ClipOval(
        child: Image.asset(
          'assets/rakeshimg/rakesh.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _actionButton(String text, bool isPrimary) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isPrimary ? const Color(0xFF00FF66) : Colors.transparent,
        foregroundColor: isPrimary ? Colors.black : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: isPrimary ? Colors.transparent : const Color(0xFF00FF66),
          ),
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 50,
        vertical: isSmallScreen ? 40 : 80,
      ),
      child: const Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'I\'m a passionate frontend developer with expertise in creating beautiful and functional web experiences.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 50,
        vertical: isSmallScreen ? 40 : 80,
      ),
      child: Column(
        children: [
          const Text(
            'My Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _projectCard('Web App', 'A modern web application'),
                _projectCard('Mobile App', 'Cross-platform mobile app'),
                _projectCard('UI Design', 'Creative user interfaces'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _projectCard(String title, String description) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 50,
        vertical: isSmallScreen ? 40 : 80,
      ),
      child: Column(
        children: [
          const Text(
            'Contact Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Let\'s work together on your next project',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _contactButton(FontAwesomeIcons.envelope, 'Email Me'),
              _contactButton(FontAwesomeIcons.linkedin, 'LinkedIn'),
              _contactButton(FontAwesomeIcons.github, 'GitHub'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactButton(IconData icon, String text) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: FaIcon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2A2A2A),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _skillItem(String skill, double level) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00FF66)),
            borderRadius: BorderRadius.circular(2),
          ),
        ],
      ),
    );
  }

  Widget _drawerSocialButton(IconData icon, String label) {
    return Builder(
      builder: (context) => IconButton(
        icon: FaIcon(icon),
        color: Colors.white,
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
    );
  }
}
