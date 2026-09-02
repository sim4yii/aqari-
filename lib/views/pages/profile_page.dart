import 'package:flutter/material.dart';
import 'package:flutter_app/app/mobile/auth_service.dart';
import 'package:flutter_app/data/notifiers.dart';

import 'package:flutter_app/views/pages/welcome_page.dart';

const Color _kBg = Color(0xFF0D1114); // near-black from your design
const Color _kAccent = Color(0xFF00E5FF); // bright cyan from your design
const Color _kSignOut = Color(0xFFFF8A73); // soft coral from your design

/// Profile tab content — sits inside your WidgetTree's Scaffold.
/// No bottom navigation bar here (you already have it).
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // your listing usage — wire these to real data later
    const int used = 1;
    const int limit = 3;

    return ColoredBox(
      color: _kBg,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ---------- header ----------
                Row(
                  children: [
                    const Text(
                      'AQARI+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // TODO: open settings
                      },
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white70,
                        size: 26.0,
                      ),
                    ),
                  ],
                ), // header
                const SizedBox(height: 18.0),

                // ---------- avatar ----------
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: _kAccent, width: 2.0),
                      boxShadow: [
                        BoxShadow(
                          color: _kAccent.withAlpha(60),
                          blurRadius: 24.0,
                        ),
                      ],
                    ),
                    // replace with your photo:
                    // CircleAvatar(backgroundImage: AssetImage('assets/fonts/images/avatar.jpg'))
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withAlpha(20),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                        size: 48.0,
                      ),
                    ),
                  ),
                ), // avatar
                const SizedBox(height: 18.0),

                const Text(
                  'Ahmed Belkacem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),

                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(15),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text(
                      'Free Account',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ), // account pill
                const SizedBox(height: 24.0),

                // ---------- listings limit card ----------
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(8),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.white.withAlpha(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Property Listings Limit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Text(
                            '$used / $limit',
                            style: TextStyle(
                              color: _kAccent,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${(used / limit * 100).round()}% Used',
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: LinearProgressIndicator(
                          value: used / limit,
                          minHeight: 8.0,
                          backgroundColor: Colors.white.withAlpha(20),
                          color: _kAccent,
                        ),
                      ), // progress bar
                      const SizedBox(height: 18.0),
                      const Center(
                        child: Text(
                          'Need to list more than $limit properties?',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13.5,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      FilledButton(
                        onPressed: () {
                          // TODO: open your upgrade / subscription flow
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 54.0),
                          backgroundColor: _kAccent,
                          foregroundColor: const Color(0xFF00262B),
                          elevation: 6,
                          shadowColor: _kAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upgrade to Agent',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: 6.0),
                            Icon(Icons.bolt, size: 20.0),
                          ],
                        ),
                      ), // upgrade button
                      const SizedBox(height: 12.0),
                      const Center(
                        child: Text(
                          'Unlimited listings & premium visibility',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ), // listings limit card
                const SizedBox(height: 22.0),

                // ---------- menu ----------
                const _MenuTile(
                  icon: Icons.favorite_border,
                  title: 'My Saved Properties',
                ),
                const SizedBox(height: 12.0),
                const _MenuTile(
                  icon: Icons.home_outlined,
                  title: 'My Listed Properties',
                  subtitle: '1 listing',
                ),
                const SizedBox(height: 12.0),
                const _MenuTile(
                  icon: Icons.person_outline,
                  title: 'Account Settings',
                ),
                const SizedBox(height: 12.0),
                const _MenuTile(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                ),
                const SizedBox(height: 20.0),

                // ---------- sign out ----------
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  leading: const Icon(
                    Icons.logout,
                    color: _kSignOut,
                    size: 24.0,
                  ),
                  title: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: _kSignOut,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () async {
                    await authService.value.signOut();
                    selectedPageNotifier.value = 0;
                    if (!context.mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomePage();
                        },
                      ),
                    );
                  },
                ), // sign out
              ], // children
            ), // Column
          ), // Padding
        ), // SingleChildScrollView
      ), // SafeArea
    ); // ColoredBox
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.icon, required this.title, this.subtitle});

  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withAlpha(12)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 6.0,
        ),
        leading: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(12),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Icon(icon, color: _kAccent, size: 22.0),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
                style: const TextStyle(color: Colors.white54, fontSize: 12.5),
              ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.white38,
          size: 24.0,
        ),
        onTap: () {
          // TODO: open this section
        },
      ),
    );
  }
}
