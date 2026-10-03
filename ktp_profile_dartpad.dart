// ╔══════════════════════════════════════════════════════════════════════╗
//                KTP x MHACKS  —  Build Your Own KTP Profile
// ╚══════════════════════════════════════════════════════════════════════╝
//
// This is the actual Profile screen from the KTP app (ktp_life), trimmed
// down so it runs in your browser. The real one loads your data from
// Firebase; this one reads it from the variables below. Break it freely!
//
// How this will work:
//   1. Hit the blue "Run" button. You should see a profile on the right.
//   2. Search (Cmd/Ctrl + F) for "CHALLENGE 1", then 2, 3, ...
//   3. Challenges often ask to "uncomment this code". Select the lines and press
//      Cmd + /  (Mac)  or  Ctrl + /  (Windows) to toggle comments on/off.
//   4. Hit Run again to see your change.
//   5. Broke something? Red squiggles tell you where. Cmd/Ctrl + Z is your
//      friend. Or ask a KTP member for assistance
//   (Yellow "isn't used" warnings are fine — they go away as you complete challenges.)
//
// CHALLENGE Road Map (line numbers are approximate, they shift as you edit)
//   🟢 1  Make it yours ............ ~line 67
//   🟢 2  Repaint the app .......... ~line 97
//   🟢 3  Get verified ............. ~line 106
//   🟡 4  Dark mode ................ ~line 280
//   🟡 5  Secret easter egg ........ ~line 323
//   🟡 6  Special tags ............. ~line 345
//   🟡 7  Fun facts ................ ~line 364 (part 2: ~line 604)
//   🔴 8  Spin to win .............. ~line 396
//   🟡 9  Follow button ............ ~line 490 (9b: ~line 715)
//   🔴 10 Design your badges ....... ~line 805
//   🔴 ⭐ Bonus: Freestyle ......... ~line 678
//   💡 Hints ....................... ~line 1329
//   🛑 Answers ..................... ~line 1419
//
// DIFFICULTY
//   🟢 = Easy
//   🟡 = Medium        
//   🔴 = Hard
//
// 🏅 EARN BADGES
//   Open "Badges" on your profile. Three grey badges are waiting:
//   Dart Beginner (every 🟢)  ·  Dart Novice (every 🟡)  ·  Dart Pro (every 🔴)
//   Clear every challenge in a level and its badge lights up.
//   Hover over a badge to see how many you've done.
//   Heads up: every Run restarts the app, so badges forget any challenge
//   you finished by tapping. After your last Run, just repeat what you did
//   in the app for each challenge to get that progress back.
//

// DART VARIABLES IN 30 SECONDS:
//   String name = 'adi';           // text
//   int taps = 0;                  // whole number
//   bool isCool = true;            // true / false
//   List<String> tags = ['a'];     // a list of things
//   Map<int, String> m = {1: 'x'}; // look up values by key

// FLUTTER IN 30 SECONDS:
//   In Flutter, EVERYTHING on screen is a "Widget": Text, Row, Column,
//   Icon, Padding, etc. You nest them inside each other like HTML.

// IMPORTANT: you can follow comments left in the code along the way to learn more about the code layout and how Dart/Flutter works
// You don't have to though, remmeber take take what you want from this and have fun! 

import 'dart:math';
import 'package:flutter/material.dart';

// ════════════════════════════════════════════════════════════════════════
// 🟢 CHALLENGE 1: Make it yours
// Change these values to your own info, then hit Run.
// Strings go inside 'single quotes'. Don't delete the semicolons ;
// ════════════════════════════════════════════════════════════════════════
const String myFirstName = 'Kappa';
const String myLastName = 'Theta Pi';
const String myPronouns = 'they/them';
const String myYear = 'Sophomore';
const String myMajors = 'Computer Science';
const String myMinors = '';
const String myColleges = 'College of Engineering';
const String myHometown = 'Ann Arbor, MI';
const String myPledgeClass = 'Alpha';
const String myLinkedIn = 'https://linkedin.com/in/your-name';
const String myBio =
    'First time writing Dart at MHacks! I like building things, drinking '
    'too much coffee, and pretending I understand CSS.';

// Profile picture: paste a link to any image. Try 'https://picsum.photos/540'
// for a random one, or set it to '' to see the empty placeholder circle.
const String myPictureURL = 'https://picsum.photos/id/1025/540';

// In this code we handle tags through one comma-separated String.
// Tags with "Director" or "Committee Lead" get highlighted and moved first.
// Try adding your own tags to the list and press Run to see them appear.

const String myTags =
    'MHacks Hacker, Flutter Newbie, Tech Director, Coffee Addict, Night Owl';

// ════════════════════════════════════════════════════════════════════════
// 🟢 CHALLENGE 2: Repaint the app
// These are the real KTP blues from lib/theme.dart.
// Colors are written as 0xAARRGGBB (alpha, red, green, blue in hex).
// Try: Color(0xFF8E44AD) purple, Color(0xFFE67E22) orange.
// ════════════════════════════════════════════════════════════════════════
const Color ktpBlue = Color(0xFF20529B); // light mode
const Color ktpBlueDark = Color(0xFF3F86F1); // dark mode

// ════════════════════════════════════════════════════════════════════════
// 🟢 CHALLENGE 3: Get verified
// Flip isEboard to true and Run. You get a blue check next to your name,
// "Brother" becomes your position, and you gain a "Goals" section at the bottom.
//
// Try another position: 'VP of Marketing', 'VP of Finance', 'VP of Engagement'...
// (Only real positions have goals. Why? Look at eBoardGoals, ~line 887.)
//
// Also try: isPledge = true (with isEboard = false).
// ════════════════════════════════════════════════════════════════════════
const bool isEboard = false;
const String eboardPosition = 'VP of Membership';
const bool isPledge = false;

// ⬇  Keep scrolling! CHALLENGE 4 is further down (~line 280), inside the
//     settings icon code of BrotherProfilePage. There's extra info to read on
//     the way down if you want to:
//       • What a "class" is (the Brother data model) ...... ~line 128
//       • Where every Dart program starts: main() ......... ~line 193
//       • Stateless vs Stateful widgets ................... ~line 198
//       • What build() does ............................... ~line 230

// ────────────────────────────────────────────────────────────────────────
// This is the data model for this code, in the real app it
// is built from a firebase (backend) document
//
// Developer Context: A "class" is sort of like a blueprint: 
// it bundles related data (and behaviors) together which keeps our code clean
// ────────────────────────────────────────────────────────────────────────
class Brother {
  final String firstName, lastName, pronouns, classStanding;
  final String majors, minors, colleges, hometown, pledgeClass;
  final String pictureURL, linkedInURL, bio, tags, eboardPos;
  final bool pledge, eboard, intendedMaj, intendedMin;
  final List<int> badges;

  const Brother({
    required this.firstName,
    required this.lastName,
    required this.pronouns,
    required this.classStanding,
    required this.majors,
    required this.minors,
    required this.colleges,
    required this.pictureURL,
    required this.bio,
    required this.tags,
    required this.pledge,
    required this.eboard,
    required this.badges,
    this.intendedMaj = false,
    this.intendedMin = false,
    this.linkedInURL = '',
    this.pledgeClass = '',
    this.eboardPos = '',
    this.hometown = '',
  });

  // A getter is a function you use like a variable. Every time you read
  // brother.fullName, it runs and builds the name from firstName + lastName,
  // so we never have to store the full name separately.
  String get fullName => '$firstName $lastName';
}

// Build a Brother object from the variables you edited above, so all of
// your profile data lives in one place.
const Brother me = Brother(
  firstName: myFirstName,
  lastName: myLastName,
  pronouns: myPronouns,
  classStanding: myYear,
  majors: myMajors,
  minors: myMinors,
  colleges: myColleges,
  hometown: myHometown,
  pledgeClass: myPledgeClass,
  pictureURL: myPictureURL,
  linkedInURL: myLinkedIn,
  bio: myBio,
  tags: myTags,
  pledge: isPledge,
  eboard: isEboard,
  eboardPos: eboardPosition,
  badges: myBadges,
);

// Every Dart program starts at main().
// runApp() takes the root widget, and everything else in the app lives inside it.
void main() => runApp(const KTPProfileApp());

// ════════════════════════════════════════════════════════════════════════
// The App + theme
//
// CORE FLUTTER CONCEPT: Stateless vs Stateful widgets
//
//   StatelessWidget: has no data of its own that changes. It just draws
//   whatever it's given (its fields/look are final). Example: BrotherProfilePage
//   below only shows the brother it was handed.
//
//   StatefulWidget: comes in TWO classes: the widget itself, plus a State
//   class that holds variables that CAN change (like _darkMode below).
//   When you change one inside setState(() { ... }), Flutter calls build()
//   again so the screen shows the new value. Change it WITHOUT setState
//   and the screen won't update.
//
// KTPProfileApp is Stateful because dark mode can be switched on and off
// while the app is running.
// ════════════════════════════════════════════════════════════════════════ 

//  ⬇  Keep scrolling! CHALLENGE 4 is further down (~line 280)

class KTPProfileApp extends StatefulWidget {
  const KTPProfileApp({super.key});

  @override
  State<KTPProfileApp> createState() => _KTPProfileAppState();
}

class _KTPProfileAppState extends State<KTPProfileApp> {
  bool _darkMode = false;

  void _toggleDarkMode() {
    setState(() => _darkMode = !_darkMode);
  }

  // WHAT build() DOES
  // Every widget has a build() method. It returns the widgets that make up
  // this part of the screen, and Flutter draws them. Flutter calls build()
  // when the widget first appears, and calls it AGAIN every time setState()
  // runs. That's how flipping _darkMode actually changes what you see.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: KTPTheme.lightTheme,
      darkTheme: KTPTheme.darkTheme,
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: BrotherProfilePage(brother: me, onSettingsTap: _toggleDarkMode),
    );
  }
}

// ════════════════════════════════════════════════════════════════════════
// The Profile Page. From lib/brotherprofile/screens/brother_profile.dart
// ════════════════════════════════════════════════════════════════════════
class BrotherProfilePage extends StatelessWidget {
  final Brother brother;
  final VoidCallback onSettingsTap;

  const BrotherProfilePage({
    required this.brother,
    required this.onSettingsTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // Same as KTPProfileAppBar (own profile: edit + settings icons)
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
            actions: [
              GestureDetector(
                child: const Icon(Icons.edit_outlined, size: 24),
                onTap: () {},
              ),
              const SizedBox(width: 10),
              GestureDetector(
                child: const Icon(Icons.settings_outlined, size: 24),
                // ══════════════════════════════════════════════════════
                // 🟡 CHALLENGE 4: Dark mode
                // Right now the ⚙️ settings icon (top right) does nothing.
                // Swap which line is commented out below, Run, then tap ⚙️.
                // Follow onSettingsTap back up to _toggleDarkMode (~line 226) — what
                // does the ! in !_darkMode do?
                // ══════════════════════════════════════════════════════
                onTap: () {},
                // onTap: onSettingsTap,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ],
        body: BrotherProfileBody(brother: brother),
      ),
    );
  }
}

class BrotherProfileBody extends StatefulWidget {
  final Brother brother;
  const BrotherProfileBody({required this.brother, super.key});

  @override
  State<BrotherProfileBody> createState() => _BrotherProfileBodyState();
}

class _BrotherProfileBodyState extends State<BrotherProfileBody> {
  // "State" = variables that can change while the app runs.
  // The _underscore means "private to this file".
  final Set<int> _done = {}; // challenges you've finished (for the badges)
  // ignore: unused_field
  int _pfpTaps = 0; // used once you finish Challenge 5
  bool _eggOn = false;
  bool _isFollowing = false;
  int _followers = 41;
  int _funFactIndex = 0;
  bool _tappedFunFact = false;
  double _turns = 0;

  Brother get brother => widget.brother;

  // ══════════════════════════════════════════════════════════════════════
  // 🟡 CHALLENGE 5: The secret easter egg 🥚
  // The REAL KTP app has a hidden easter egg: tap one specific brother's
  // profile picture 5 times and their name AND picture change.
  // This is almost exactly the real code. Let's turn it on for you.
  //   a) Uncomment the 5 lines inside _onPfpTap below.
  //   b) Run, then tap your profile picture 5 times.
  //   c) Change _eggDisplayName and _eggPictureURL to something funnier.
  //   d) 🔴 Make it take 10 taps instead. Can you make tapping again
  //      turn it back off? (hint: _eggOn = !_eggOn)
  // ══════════════════════════════════════════════════════════════════════
  static const _eggDisplayName = 'Professional Bug Creator 🐛';
  static const _eggPictureURL = 'https://picsum.photos/id/237/540';

  void _onPfpTap() {
    // if (_eggOn) return;
    // _pfpTaps += 1;
    // if (_pfpTaps >= 5) {
    //   setState(() => _eggOn = true);
    // }
  }

  // ══════════════════════════════════════════════════════════════════════
  // 🟡 CHALLENGE 6: Make your own special tags glow
  // The real app highlights tags with "director" or "committee lead" in
  // them and moves them to the front. Look at isLeadershipTag below (~line 353), then
  // write isSpecialTag so tags containing "hack" (any capitalization) are
  // special. Special tags turn gold ✨ and move right after leadership tags.
  // Hint: copy the pattern from isLeadershipTag.
  // Stuck? Hints at ~line 1370, answer at ~line 1465.
  // ══════════════════════════════════════════════════════════════════════
  bool isLeadershipTag(String tag) {
    final lower = tag.toLowerCase();
    return lower.contains('director') || lower.contains('committee lead');
  }

  bool isSpecialTag(String tag) {
    // TODO: replace false with your own rule
    return false;
  }

  // ══════════════════════════════════════════════════════════════════════
  // 🟡 CHALLENGE 7 (part 1 of 2): Fun facts
  // Add a few fun facts about yourself to this list.
  // Part 2 is further down in build() — search "CHALLENGE 7 (part 2" (~line 604).
  // ══════════════════════════════════════════════════════════════════════
  final List<String> _funFacts = [
    'I once debugged for 3 hours. It was a missing semicolon.',
    'My first program printed "Hello, World!" and I cried.',
    'I have strong opinions about tabs vs. spaces.',
  ];

  void _nextFunFact() {
    setState(() {
      _tappedFunFact = true;
      // Random().nextInt(n) gives a random number from 0 to n-1
      _funFactIndex = Random().nextInt(_funFacts.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayName = _eggOn ? _eggDisplayName : brother.fullName;

    // Checks which challenges you've finished (see the CHALLENGE TRACKER, ~line 836)
    _checkChallenges(context);

    // ── Profile picture ────────────────────────────────────────────────
    Widget avatar = KTPProfileWidget(
      imagePath: _eggOn ? _eggPictureURL : brother.pictureURL,
      onTap: _onPfpTap,
    );

    // ══════════════════════════════════════════════════════════════════
    // 🔴 CHALLENGE 8: Spin to win 🌀
    // Uncomment BOTH lines below. The first wraps the picture in an
    // AnimatedRotation, the second spins it when you press-and-hold.
    // Try changing turns += 1 to 0.25, or the duration to 2 seconds.
    // Bonus: look up AnimatedScale and make it grow instead!
    // ══════════════════════════════════════════════════════════════════
    // avatar = AnimatedRotation(turns: _turns, duration: const Duration(milliseconds: 800), curve: Curves.easeOutBack, child: avatar);
    // avatar = GestureDetector(onLongPress: () => setState(() => _turns += 1), child: avatar);

    return Scrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //profile picture
              avatar,
              const SizedBox(height: 20),
              // Row for Name and LinkedIn button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            displayName,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 100,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // "collection if": only adds the badge when eboard is true
                        if (brother.eboard) ...[
                          Tooltip(
                            preferBelow: false,
                            triggerMode: TooltipTriggerMode.tap,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1DA1F2)
                                  .withValues(alpha: 0.95),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            message: 'EBoard Member',
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            child: const Icon(
                              Icons.verified,
                              color: Color(0xFF1DA1F2),
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 2),
                        ],
                      ],
                    ),
                  ),
                  if (brother.linkedInURL.isNotEmpty) ...[
                    const LinkedInButton(),
                  ],
                ],
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleMedium,
                  children: <TextSpan>[
                    TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      // ? : is a mini if/else: condition ? ifTrue : ifFalse
                      text:
                          '${brother.eboard
                              ? brother.eboardPos
                              : brother.pledge
                              ? 'Pledge'
                              : 'Brother'}  ',
                    ),
                    TextSpan(text: '(${brother.pronouns})'),
                  ],
                ),
              ),

              // ══════════════════════════════════════════════════════════
              // 🟡 CHALLENGE 9: Follow button (a NEW feature!)
              //   a) Uncomment the line below to show the follow row.
              //   b) Click Follow. The button changes... but the count
              //      doesn't! Search "CHALLENGE 9b" (~line 715) to fix it.
              // ══════════════════════════════════════════════════════════
              // _buildFollowRow(context),
              const SizedBox(height: 16),
              const Divider(thickness: 1, height: 0),

              // Year, Major, College
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    KTPBrotherProfileInfoWidget(
                      brotherYear: brother.classStanding,
                      brotherMajor:
                          "${brother.intendedMaj ? '[Prospective] ' : ''}${brother.majors}",
                      brotherMinor:
                          "${brother.intendedMin ? '[Prospective] ' : ''}${brother.minors}",
                      brotherCollege: brother.colleges,
                      brotherPC: brother.pledgeClass,
                      brotherHometown: brother.hometown,
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1, height: 0),
              if (brother.tags.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Builder(
                    builder: (context) {
                      // .split(',') turns "a, b, c" into a List: ['a', ' b', ' c']
                      // .map() transforms each item, .where() keeps matching ones
                      List<String> allTags = brother.tags
                          .split(',')
                          .map((e) => e.trim())
                          .where((e) => e.isNotEmpty)
                          .toList();

                      // find director/committee lead tags
                      List<String> leadershipTags = allTags
                          .where(isLeadershipTag)
                          .toList();
                      List<String> specialTags = allTags
                          .where(
                            (t) =>
                                isSpecialTag(t) && !leadershipTags.contains(t),
                          )
                          .toList();
                      List<String> normalTags = allTags
                          .where(
                            (tag) =>
                                !leadershipTags.contains(tag) &&
                                !specialTags.contains(tag),
                          )
                          .toList();
                      List<String> sortedTags = [
                        ...leadershipTags,
                        ...specialTags,
                        ...normalTags,
                      ];

                      return Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: sortedTags.map((tag) {
                          bool isLeadership = leadershipTags.contains(tag);
                          bool isSpecial = specialTags.contains(tag);
                          Color? tagColor;
                          if (isLeadership) {
                            if (Theme.of(context).brightness ==
                                Brightness.dark) {
                              tagColor = Theme.of(context).primaryColor
                                  .withValues(alpha: 0.4);
                            } else {
                              tagColor = Theme.of(context).primaryColor
                                  .withValues(alpha: 0.7);
                            }
                          } else if (isSpecial) {
                            tagColor = const Color(0xFFE5A50A);
                          }
                          return KTPProfileTag(
                            text: tag,
                            backgroundColor: tagColor,
                            textColor: tagColor != null ? Colors.white : null,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                const Divider(thickness: 1, height: 0),
              ],
              if (brother.bio.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.titleMedium,
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'About Me\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: brother.bio),
                      ],
                    ),
                  ),
                ),
              ],

              // ══════════════════════════════════════════════════════════
              // 🟡 CHALLENGE 7 (part 2 of 2): Fun fact card
              // Uncomment the line below. Click the card for a new
              // random fact. 🔴 Bonus: instead of random, make it go
              // to the NEXT fact in order (hint: % is "remainder").
              // ══════════════════════════════════════════════════════════
              // _buildFunFactCard(context),

              // Badges (the Dart level badges + your own badges)
              if (brother.bio.isNotEmpty)
                const Divider(thickness: 1, height: 0),
              _getExpansionTile(
                context,
                initiallyExpanded: true,
                Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: 'Badges',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      WidgetSpan(child: SizedBox(width: 6)),
                      WidgetSpan(
                        child: Icon(Icons.info_outline_rounded, size: 20.0),
                      ),
                    ],
                  ),
                ),
                [
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 9.0,
                    children: [
                      for (final level in dartLevels)
                        KTPBadge(
                          badge: level.badge,
                          locked: !level.challenges.every(_done.contains),
                          progress:
                              '${level.challenges.where(_done.contains).length}'
                              '/${level.challenges.length}',
                        ),
                      ...(brother.badges.toList()..sort()).map(badgeFromId),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              const Divider(thickness: 1.0, height: 0),
              if (brother.eboard &&
                  eBoardGoals.containsKey(brother.eboardPos)) ...[
                _getExpansionTile(
                  context,
                  const Text(
                    "Goals",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  [
                    Column(
                      children: eBoardGoals[brother.eboardPos]!.split('\n').map(
                        (goal) {
                          return KTPBulletPoint(text: goal);
                        },
                      ).toList(),
                    ),
                  ],
                ),
                const Divider(thickness: 1, height: 0),
              ],

              // ══════════════════════════════════════════════════════════
              // 🔴 BONUS CHALLENGE: Freestyle!
              // Add your own section right here. Some ideas:
              //   • "Currently hacking on" card with your MHacks project
              //     (copy _buildFunFactCard, ~line 745, as a starting point)
              //   • A new collapsible section using _getExpansionTile,
              //     like Badges and Goals above (~line 614)
              //   • A Slider "hype meter" that changes an emoji 😐 → 🔥
              //   • A button that swaps your bio for a random one
              // ══════════════════════════════════════════════════════════
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helper widgets ───────────────────────────────────────────────────
  // Splitting build() into smaller methods keeps it readable.

  // ignore: unused_element
  Widget _buildFollowRow(BuildContext context) {
    // used once you finish Challenge 9
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(
            '$_followers followers',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                _isFollowing = !_isFollowing;
                // ══════════════════════════════════════════════════════
                // 🟡 CHALLENGE 9b: Update the follower count
                // Write ONE line here that adds 1 to _followers when you
                // follow, and subtracts 1 when you unfollow.
                // Hint: _isFollowing ? ___ : ___
                // ══════════════════════════════════════════════════════
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              decoration: BoxDecoration(
                color: _isFollowing
                    ? Theme.of(context).cardColor
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                _isFollowing ? 'Following' : 'Follow',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _isFollowing ? null : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildFunFactCard(BuildContext context) {
    // used once you finish Challenge 7
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: _nextFunFact,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Text('💡', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 10),
              Expanded(child: Text(_funFacts[_funFactIndex])),
              const Icon(Icons.refresh_rounded, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  // Collapsible section, used for Badges and Goals. From the real app.
  Widget _getExpansionTile(
    BuildContext context,
    Text titleText,
    List<Widget>? children, {
    bool initiallyExpanded = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: IgnorePointer(
            ignoring: children == null,
            child: ExpansionTile(
              initiallyExpanded: initiallyExpanded,
              childrenPadding: const EdgeInsets.only(bottom: 16),
              tilePadding: const EdgeInsets.all(0),
              title: titleText,
              collapsedIconColor: isDark
                  ? Colors.white
                  : const Color(0xFF212529),
              iconColor: isDark ? Colors.white : const Color(0xFF212529),
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              textColor: isDark ? Colors.white : Colors.black,
              children: children ?? [],
            ),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════════
// 🔴 CHALLENGE 10: Design your badges
// Hover over (or tap) a badge to see its name.
// badgeInfo is a Map: give it a number (key), get back a badge (value).
// These are real KTP badges! The real app uses image files for them
// (see lib/peoplelist/constants.dart); we draw the same hexagon in code.
// Each badge is KTPBadgeData(title, icon, color).
//   a) Add badge 6 with your own title, icon and color, e.g.
//      6: KTPBadgeData('MHacks 2026', Icons.rocket, Color(0xFF8E44AD)),
//      (Type "Icons." in the editor to browse every icon)
//   b) Add 6 to myBadges so it shows on your profile.
//   c) What happens if you put 99 in myBadges? Fix badgeFromId so unknown
//      ids show a "?" badge instead of crashing. (hint: badgeInfo[id] ?? ...)
// ════════════════════════════════════════════════════════════════════════
const Map<int, KTPBadgeData> badgeInfo = {
  0: KTPBadgeData('EBoard', Icons.account_balance, Color(0xFF2F5FA8)),
  1: KTPBadgeData('Director', Icons.campaign, Color(0xFF7A4FB0)),
  2: KTPBadgeData('Dev Team', Icons.code, Color(0xFF4E8A3E)),
  3: KTPBadgeData('Design Team', Icons.brush, Color(0xFFC2477A)),
  4: KTPBadgeData('PM Team', Icons.assignment, Color(0xFFC46A1B)),
  5: KTPBadgeData('Hackathon Winner', Icons.laptop, Color(0xFFB8960F)),
};

const List<int> myBadges = [2, 5];

// Turns a badge number into a badge widget.
KTPBadge badgeFromId(int id) {
  final badge = badgeInfo[id]!;
  return KTPBadge(badge: badge);
}

// ════════════════════════════════════════════════════════════════════════
// 🏅 CHALLENGE TRACKER: figures out which challenges you've finished.
// You don't need to edit this. (Reading it is a bit of a spoiler 👀)
// ════════════════════════════════════════════════════════════════════════
// The three Dart level badges, and which challenges unlock each one.
// (The bonus freestyle challenge is on the honor system 😉)
class DartLevel {
  final KTPBadgeData badge;
  final List<int> challenges;
  const DartLevel(this.badge, this.challenges);
}

const List<DartLevel> dartLevels = [
  DartLevel(
    KTPBadgeData('Dart Beginner', Icons.flutter_dash, Color(0xFF2E8B57)),
    [1, 2, 3],
  ),
  DartLevel(
    KTPBadgeData('Dart Novice', Icons.bolt, Color(0xFFC79A00)),
    [4, 5, 6, 7, 9],
  ),
  DartLevel(
    KTPBadgeData('Dart Pro', Icons.rocket_launch, Color(0xFFC0392B)),
    [8, 10],
  ),
];

// An "extension" adds methods to a class from outside it.
extension _ChallengeTracker on _BrotherProfileBodyState {
  void _checkChallenges(BuildContext context) {
    if (brother.fullName != 'Kappa Theta Pi') _done.add(1);
    if (ktpBlue != const Color(0xFF20529B) ||
        ktpBlueDark != const Color(0xFF3F86F1)) {
      _done.add(2);
    }
    if (brother.eboard || brother.pledge) _done.add(3);
    if (Theme.of(context).brightness == Brightness.dark) _done.add(4);
    if (_eggOn) _done.add(5);
    if (_followers != 41) _done.add(9);
    if (brother.tags.split(',').any((t) => isSpecialTag(t.trim()))) {
      _done.add(6);
    }
    if (_tappedFunFact) _done.add(7);
    if (_turns != 0) _done.add(8);
    if (myBadges.any((id) => id > 5 && badgeInfo.containsKey(id))) {
      _done.add(10);
    }
  }
}

// Real EBoard goals, from lib/peoplelist/constants.dart (eBoardMembers).
// Each "\n" starts a new bullet point.
const Map<String, String> eBoardGoals = {
  "VP of Membership": "Organize rush events and pledge requirements, acting as a liaison between potential members and the Executive Board\nEngage active brothers and support rushees throughout the KTP rush process\nCultivate close friendships in every pledge class and successfully integrate them into the KTP brotherhood",
  "VP of Engagement": "Coordinate events that promote bonding within the fraternity and the community\nArrange a variety of events throughout the semester and maintain a calendar for fraternity-related events\nPlan and carry out events that members show excitement about and want to see",
  "VP of Marketing": "Maintain the fraternity's social media presence and develop its digital strategy\nPromote KTP across the entire university to attract a diverse range of majors and people\nCreate apparel for brothers",
  "VP of Finance": "Keep accurate records and control of the fraternity's finances\nMaintain financial transparency within KTP and increase financial literacy for all brothers\nLead efforts for additional fundraising opportunities for the fraternity from the university and other sources",
};

// ════════════════════════════════════════════════════════════════════════
// Reusable widgets, from lib/brotherprofile/widgets.dart
// You don't need to edit these... but you can!
// ════════════════════════════════════════════════════════════════════════

// Rushee / brother profile picture
class KTPProfileWidget extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const KTPProfileWidget({
    super.key,
    required this.imagePath,
    this.height = 270,
    this.width = 270,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = imagePath.trim().isNotEmpty
        ? NetworkImage(imagePath)
        : null;
    final avatar = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(135),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(60),
            image: provider == null
                ? null
                : DecorationImage(image: provider, fit: BoxFit.cover),
          ),
        ),
      ),
    );
    if (onTap == null) return avatar;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: avatar,
    );
  }
}

class KTPBrotherProfileInfoWidget extends StatelessWidget {
  final String brotherYear,
      brotherMajor,
      brotherMinor,
      brotherCollege,
      brotherPC;
  final String? brotherHometown;

  const KTPBrotherProfileInfoWidget({
    super.key,
    required this.brotherYear,
    required this.brotherMajor,
    required this.brotherMinor,
    required this.brotherCollege,
    required this.brotherPC,
    this.brotherHometown,
  });

  // The real app repeats this RichText 6 times. We pulled it into a helper
  // so you can see the pattern. (Want to add a line? Add a _line() below!)
  Widget _line(BuildContext context, String label, String value) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleMedium,
        children: <TextSpan>[
          TextSpan(
            text: '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _line(context, 'Year', brotherYear),
          _line(context, 'Major', brotherMajor),
          if (brotherMinor.isNotEmpty) _line(context, 'Minor', brotherMinor),
          _line(context, 'College', brotherCollege),
          if (brotherPC.isNotEmpty) _line(context, 'Pledge Class', brotherPC),
          if (brotherHometown!.isNotEmpty)
            _line(context, 'Hometown', brotherHometown!),
        ],
      ),
    );
  }
}

// The real app uses the LinkedIn logo image here.
class LinkedInButton extends StatelessWidget {
  const LinkedInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 23,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF0A66C2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'in',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          height: 1.1,
        ),
      ),
    );
  }
}

// What a badge is: a title, an icon, and a color.
class KTPBadgeData {
  final String title;
  final IconData icon;
  final Color color;
  const KTPBadgeData(this.title, this.icon, this.color);
}

// One badge, drawn like the hexagon badge images in the real app:
// a dark border, a lighter fill, and the icon in the dark color.
// Locked badges are grey; when one unlocks it lights up with a little pop.
class KTPBadge extends StatelessWidget {
  final KTPBadgeData badge;
  final bool locked;
  final String? progress; // e.g. '2/3', shown when you hover

  const KTPBadge({
    required this.badge,
    this.locked = false,
    this.progress,
    super.key,
  });

  static const Color _lockedColor = Color(0xFF6E6886);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Tooltip(
      preferBelow: false,
      triggerMode: TooltipTriggerMode.tap,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      message: progress == null ? badge.title : '${badge.title}  $progress',
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: locked ? 0 : 1),
        duration: const Duration(milliseconds: 700),
        builder: (context, t, _) {
          final color = Color.lerp(_lockedColor, badge.color, t)!;
          return Transform.scale(
            scale: 1 + 0.25 * sin(pi * t), // pops while lighting up
            child: Opacity(
              opacity: (isDark ? 0.92 : 1) * (0.55 + 0.45 * t),
              child: SizedBox(
                height: 50,
                width: 41,
                child: CustomPaint(
                  painter: _HexagonPainter(
                    border: color,
                    fill: Color.lerp(color, Colors.white, 0.4)!,
                  ),
                  child: Icon(badge.icon, color: color, size: 22),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color border, fill;
  const _HexagonPainter({required this.border, required this.fill});

  // A hexagon with a point at the top, shrunk inward by `inset` pixels
  Path _hexagon(Size size, double inset) {
    final w = size.width, h = size.height;
    return Path()
      ..moveTo(w / 2, inset)
      ..lineTo(w - inset, h * 0.25 + inset / 2)
      ..lineTo(w - inset, h * 0.75 - inset / 2)
      ..lineTo(w / 2, h - inset)
      ..lineTo(inset, h * 0.75 - inset / 2)
      ..lineTo(inset, h * 0.25 + inset / 2)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(_hexagon(size, 0), Paint()..color = border);
    canvas.drawPath(_hexagon(size, 4), Paint()..color = fill);
  }

  @override
  bool shouldRepaint(_HexagonPainter old) =>
      old.border != border || old.fill != fill;
}

class KTPBulletPoint extends StatelessWidget {
  final String text;
  const KTPBulletPoint({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      contentPadding: const EdgeInsets.only(left: 10),
      minLeadingWidth: 5,
      leading: const KTPBullet(),
      horizontalTitleGap: 10,
      title: SelectableText(text, style: const TextStyle(fontSize: 17)),
    );
  }
}

class KTPBullet extends StatelessWidget {
  const KTPBullet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5,
      width: 5.5,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class KTPProfileTag extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  const KTPProfileTag({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    bool pride = text.contains("LGBT") || text.toLowerCase().contains("pride");

    final Color defaultBg = Theme.of(context).brightness == Brightness.light
        ? const Color(0xFFF2F2F2)
        : const Color(0xFF28282C);

    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 2, bottom: 3),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? defaultBg,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: pride
              ? GradientText(
                  text.trim(),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.pink,
                      Colors.purple,
                      Colors.deepPurple,
                      Colors.deepPurple,
                      Colors.indigo,
                      Colors.blue,
                      Colors.lightBlue,
                      Colors.cyan,
                      Colors.teal,
                      Colors.green,
                      Colors.lightGreen,
                      Colors.lime,
                      Colors.yellow,
                      Colors.amber,
                      Colors.orange,
                      Colors.deepOrange,
                    ],
                  ),
                )
              : Text(
                  text.trim(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        textColor ??
                        (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black87),
                    fontWeight: backgroundColor != null
                        ? FontWeight.bold
                        : FontWeight.normal,
                    height: 1.2,
                  ),
                ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

// ════════════════════════════════════════════════════════════════════════
// Theme: lib/theme.dart from the real app (the app uses the SF Pro Display
// font, which DartPad doesn't have, so text looks slightly different).
// ════════════════════════════════════════════════════════════════════════
class KTPTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black, size: 22),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black, size: 20),
    ),
    primarySwatch: buildMaterialColor(ktpBlue),
    primaryColor: ktpBlue,
    cardColor: const Color(0xFFF6F6F6),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 16),
      labelLarge: TextStyle(fontSize: 16),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: const Color(0xFF101010),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white, size: 20),
      backgroundColor: Color(0xFF101010),
      elevation: 0,
      iconTheme: IconThemeData(size: 20),
    ),
    primarySwatch: buildMaterialColor(ktpBlueDark),
    primaryColor: ktpBlueDark,
    cardColor: const Color(0xFF1C1C1E),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 16),
      labelLarge: TextStyle(fontSize: 16),
    ),
  );

  // Converts a HEX color into a MaterialColor. No need to know how it works.
  static MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = (color.r * 255).round(),
        g = (color.g * 255).round(),
        b = (color.b * 255).round();

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.toARGB32(), swatch);
  }
}

// ════════════════════════════════════════════════════════════════════════
// 💡 HINTS: nudges, no answers. Try these before peeking at the answers.
// ════════════════════════════════════════════════════════════════════════
//
// GENERAL
//   • Red squiggle? Hover over it. The message usually says exactly what's
//     wrong (missing ; or ), a typo in a name, wrong type...
//   • Every ( { [ needs a matching ) } ]. Click next to one and the editor
//     highlights its partner.
//   • Commas: items in a list of widgets (children: [ ... ]) end with ,
//   • Nothing changed? Did you hit Run again?
//   • Hover over a badge on your profile to see how many challenges in that
//     level you've done (e.g. "Dart Novice  2/5").
//
// CHALLENGE 1 (Make it yours)
//   • Text must stay inside quotes: 'like this'.
//   • Name has an apostrophe, like O'Brien? Use double quotes: "O'Brien".
//   • Leave a value as '' (empty) and that line disappears from the profile.
//   • Dart Beginner counts this as done once your name isn't "Kappa Theta Pi".
//
// CHALLENGE 2 (Repaint the app)
//   • Keep the 0xFF at the front. That's the alpha (FF = fully visible).
//     The last 6 characters are the same hex code as on any color picker.
//   • ktpBlue is light mode. You'll only see ktpBlueDark after Challenge 4.
//
// CHALLENGE 3 (Get verified)
//   • Goals only show if eboardPosition EXACTLY matches a key in
//     eBoardGoals: same spelling, same capitals.
//   • isPledge does nothing while isEboard is true. Look at the ? : chain
//     under "? : is a mini if/else" to see why: eboard is checked first.
//
// CHALLENGE 4 (Dark mode)
//   • You need exactly ONE onTap: line active. Comment one, uncomment the other.
//   • onSettingsTap is passed in from _KTPProfileAppState, where it's
//     _toggleDarkMode. ! means "not": !true is false, !false is true.
//
// CHALLENGE 5 (Easter egg)
//   • Uncomment all 5 lines, including the closing } of the if.
//   • For 5d: the line "if (_eggOn) return;" stops counting once the egg is
//     on, so tapping can never turn it off. That line has to go.
//   • Reset _pfpTaps back to 0 after flipping, or it'll flip on every tap.
//
// CHALLENGE 6 (Special tags)
//   • isLeadershipTag lowercases the tag first, so 'Hack', 'HACK' and 'hack'
//     all match. Do the same.
//   • .contains('something') returns true or false, which is exactly what
//     isSpecialTag needs to return.
//
// CHALLENGE 7 (Fun facts)
//   • Each fact is a String in quotes, followed by a comma.
//   • Random can pick the same fact twice in a row. That's not a bug!
//   • Bonus: % gives the remainder. 3 % 3 is 0, so (index + 1) % length
//     counts 0, 1, 2, 0, 1, 2... and never goes past the end of the list.
//
// CHALLENGE 8 (Spin to win)
//   • Uncomment BOTH lines. It's PRESS AND HOLD, not a click.
//   • turns: 1 is one full spin, 0.25 is a quarter turn.
//   • AnimatedScale works just like AnimatedRotation, but takes scale:
//     instead of turns:. You'll need a new state variable, like _turns.
//
// CHALLENGE 9 (Follow button)
//   • 9a: the line to uncomment ends in a comma. Keep it.
//   • 9b: by the time your line runs, _isFollowing has ALREADY been flipped.
//     So if it's true now, you just followed (+1).
//   • x += 1 is short for x = x + 1.
//
// CHALLENGE 10 (Design your badges)
//   • Each entry in badgeInfo is  number: KTPBadgeData(...),  with a comma.
//   • Adding to badgeInfo isn't enough. myBadges is the list of badges that
//     actually show on your profile.
//   • 10c: the ! in badgeInfo[id]! means "I promise this isn't null".
//     For 99 there's no badge, so that promise breaks and the app crashes.
//     ?? means "if the left side is null, use the right side instead".
//
// CHALLENGE BONUS (Freestyle)
//   • Your new widget goes inside the children: [ ... ] list, right where
//     the Bonus Challenge comment is, and needs a comma after it.
//   • Need something to change when tapped? Add a state variable next to
//     _followers, and change it inside setState(() { ... }).
//
//
//
//
//
//
//
//
//
//
//
// ════════════════════════════════════════════════════════════════════════
// 🛑 ANSWERS: full spoilers below, only if you're really stuck
// ════════════════════════════════════════════════════════════════════════
//
//
//
//
//
//
//
//
//
//
// CHALLENGE 1:
//   const String myFirstName = 'Ada';
//   const String myLastName = 'Lovelace';
//   ...and so on for each line.
//
// CHALLENGE 2:
//   const Color ktpBlue = Color(0xFF8E44AD);
//
// CHALLENGE 3:
//   const bool isEboard = true;
//   const String eboardPosition = 'VP of Marketing';
//
// CHALLENGE 4 (in BrotherProfilePage):
//   // onTap: () {},
//   onTap: onSettingsTap,
//
// CHALLENGE 5 (a, b):
//   void _onPfpTap() {
//     if (_eggOn) return;
//     _pfpTaps += 1;
//     if (_pfpTaps >= 5) {
//       setState(() => _eggOn = true);
//     }
//   }
//
// CHALLENGE 5d (10 taps, and tapping again turns it off):
//   void _onPfpTap() {
//     _pfpTaps += 1;
//     if (_pfpTaps >= 10) {
//       setState(() => _eggOn = !_eggOn);
//       _pfpTaps = 0;
//     }
//   }
//
// CHALLENGE 6:
//   bool isSpecialTag(String tag) {
//     return tag.toLowerCase().contains('hack');
//   }
//
// CHALLENGE 7 part 1:
//   final List<String> _funFacts = [
//     'I once debugged for 3 hours. It was a missing semicolon.',
//     'I can solve a Rubik\'s cube in under a minute.',
//     "I've been to 4 hackathons.",
//   ];
//
// CHALLENGE 7 part 2 (in build()):
//   _buildFunFactCard(context),
//
// CHALLENGE 7 bonus (in _nextFunFact, replacing the Random() line):
//   _funFactIndex = (_funFactIndex + 1) % _funFacts.length;
//
// CHALLENGE 8:
//   avatar = AnimatedRotation(turns: _turns, duration: const Duration(milliseconds: 800), curve: Curves.easeOutBack, child: avatar);
//   avatar = GestureDetector(onLongPress: () => setState(() => _turns += 1), child: avatar);
//
// CHALLENGE 8 bonus (grow instead of spin):
//   1. Next to _turns, add:    double _scale = 1;
//   2. Replace the two lines with:
//   avatar = AnimatedScale(scale: _scale, duration: const Duration(milliseconds: 400), child: avatar);
//   avatar = GestureDetector(onLongPress: () => setState(() => _scale = _scale == 1 ? 1.3 : 1), child: avatar);
//   (Dart Pro still needs the spin version for the badge to count.)
//
// CHALLENGE 9a (in build()):
//   _buildFollowRow(context),
//
// CHALLENGE 9b (in _buildFollowRow, under _isFollowing = !_isFollowing;):
//   _followers += _isFollowing ? 1 : -1;
//
// CHALLENGE 10a (add inside badgeInfo, after badge 5):
//   6: KTPBadgeData('MHacks 2026', Icons.rocket, Color(0xFF8E44AD)),
//
// CHALLENGE 10b:
//   const List<int> myBadges = [2, 5, 6];
//
// CHALLENGE 10c (in badgeFromId):
//   final badge = badgeInfo[id] ??
//       const KTPBadgeData('Unknown badge', Icons.question_mark, Colors.grey);
//
// CHALLENGE BONUS (one example: a "Currently hacking on" card, placed where
// the Bonus Challenge comment is):
//   Container(
//     padding: const EdgeInsets.all(12),
//     margin: const EdgeInsets.only(top: 20),
//     decoration: BoxDecoration(
//       color: Theme.of(context).cardColor,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: const Text('🚀 Currently hacking on: an app that rates dining hall food'),
//   ),
