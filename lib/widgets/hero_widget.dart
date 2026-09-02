import 'package:flutter/material.dart';

const Color _kBg = Color(0xFF0D1114); // near-black from your design
const Color _kAccent = Color(0xFF00E5FF); // bright cyan from your design

/// Home tab content — designed to sit inside your WidgetTree's Scaffold.
/// No bottom navigation bar here (you already have it).
class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _kBg,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------- header ----------
                Row(
                  children: [
                    // logo réel
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/fonts/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      'AQARI+',
                      style: TextStyle(
                        color: _kAccent,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Spacer(),
                    // bell with notification dot
                    Stack(
                      children: [
                        const Icon(
                          Icons.notifications_none,
                          color: Colors.white70,
                          size: 26.0,
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: _kAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14.0),
                    // avatar — replace with your photo:
                    // CircleAvatar(backgroundImage: AssetImage(...))
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white.withAlpha(20),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                        size: 22.0,
                      ),
                    ),
                  ],
                ), // header
                const SizedBox(height: 22.0),

                // ---------- search ----------
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search homes, apartments...',
                          hintStyle: const TextStyle(
                            color: Colors.white38,
                            fontSize: 14.5,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white38,
                            size: 22.0,
                          ),
                          filled: true,
                          fillColor: Colors.white.withAlpha(10),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: BorderSide(
                              color: Colors.white.withAlpha(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(
                              color: _kAccent,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(10),
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(color: Colors.white.withAlpha(20)),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: _kAccent,
                        size: 22.0,
                      ),
                    ), // filter button
                  ],
                ), // search
                const SizedBox(height: 18.0),

                // ---------- category chips ----------
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      _CategoryChip(
                        icon: Icons.shopping_bag_outlined,
                        label: 'Buy',
                      ),
                      SizedBox(width: 12.0),
                      _CategoryChip(icon: Icons.key_outlined, label: 'Rent'),
                      SizedBox(width: 12.0),
                      _CategoryChip(
                        icon: Icons.handyman_outlined,
                        label: 'Artisans',
                      ),
                    ],
                  ),
                ), // chips
                const SizedBox(height: 22.0),

                // ---------- Ask AQARI AI card ----------
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F2126),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: const Color(0x3D00E5FF)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _kAccent.withAlpha(26),
                        ),
                        child: const Icon(
                          Icons.smart_toy_outlined,
                          color: _kAccent,
                          size: 30.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Ask AQARI AI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Your smart real estate assistant for price\ntrends and property insights.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13.5,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 18.0),
                      FilledButton(
                        onPressed: () {
                          // TODO: open your AI Chat tab / page
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50.0),
                          backgroundColor: _kAccent,
                          foregroundColor: const Color(0xFF00262B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bolt, size: 20.0),
                            SizedBox(width: 6.0),
                            Text(
                              'Ask AI',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), // Ask AI card
                const SizedBox(height: 26.0),

                // ---------- featured listings ----------
                const Text(
                  'Featured Listings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Handpicked premium properties for you',
                        style: TextStyle(color: Colors.white54, fontSize: 13.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: open the full listings page
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: _kAccent,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _PropertyCard(
                        heroTag: 'listing-1',
                        price: '35,000 DA/m',
                        title: 'Skyview Penthouse',
                        location: 'Hydra, Algiers',
                        stats: [
                          _Stat(Icons.bed_outlined, '3'),
                          _Stat(Icons.bathtub_outlined, '2'),
                          _Stat(Icons.square_foot, '120m²'),
                        ],
                      ),
                    ),
                    SizedBox(width: 14.0),
                    Expanded(
                      child: _PropertyCard(
                        heroTag: 'listing-2',
                        price: '120M DA',
                        title: 'Azure Garden Villa',
                        location: 'Cheraga, Algiers',
                        stats: [
                          _Stat(Icons.bed_outlined, '5'),
                          _Stat(Icons.bathtub_outlined, '4'),
                          _Stat(Icons.square_foot, '450m²'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _PropertyCard(
                        heroTag: 'listing-3',
                        price: '42,000 DA/m',
                        title: 'Modern Loft Central',
                        location: 'Sidi Yahia, Algiers',
                        stats: [
                          _Stat(Icons.bed_outlined, '2'),
                          _Stat(Icons.bathtub_outlined, '1'),
                          _Stat(Icons.square_foot, '85m²'),
                        ],
                      ),
                    ),
                    SizedBox(width: 14.0),
                    Expanded(
                      child: _PropertyCard(
                        heroTag: 'listing-4',
                        price: '15,000 DA/m',
                        title: 'Nexus Business Hub',
                        location: 'Bab Ezzouar, Algiers',
                        stats: [
                          _Stat(Icons.business_outlined, 'Office'),
                          _Stat(Icons.bolt, 'Premium'),
                          _Stat(Icons.square_foot, '200m²'),
                        ],
                      ),
                    ),
                  ],
                ),
              ], // children
            ), // Column
          ), // Padding
        ), // SingleChildScrollView
      ), // SafeArea
    ); // ColoredBox
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 18.0),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PropertyCard extends StatelessWidget {
  const _PropertyCard({
    required this.heroTag,
    required this.price,
    required this.title,
    required this.location,
    required this.stats,
  });

  final String heroTag;
  final String price;
  final String title;
  final String location;
  final List<Widget> stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/fonts/images/bg.jpg',
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: Colors.black26,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: _kAccent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF00262B),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ), // price pill
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black45,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 17.0,
                ),
              ), // heart
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.white54,
              size: 14.0,
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white54, fontSize: 12.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: stats),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat(this.icon, this.label);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white54, size: 14.0),
        const SizedBox(width: 4.0),
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 12.0),
        ),
      ],
    );
  }
}
