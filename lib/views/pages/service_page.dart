import 'package:flutter/material.dart';

const Color _kBg = Color(0xFF0D1114); // near-black from your design
const Color _kAccent = Color(0xFF00E5FF); // bright cyan from your design
const Color _kOnline = Color(0xFF4CAF50); // green online dot

// ---------- Algerian wilayas (official numbering) ----------
const Map<String, String> algerianWilayas = {
  '01': 'Adrar',
  '02': 'Chlef',
  '03': 'Laghouat',
  '04': 'Oum El Bouaghi',
  '05': 'Batna',
  '06': 'Béjaïa',
  '07': 'Biskra',
  '08': 'Béchar',
  '09': 'Blida',
  '10': 'Bouira',
  '11': 'Tamanrasset',
  '12': 'Tébessa',
  '13': 'Tlemcen',
  '14': 'Tiaret',
  '15': 'Tizi Ouzou',
  '16': 'Alger',
  '17': 'Djelfa',
  '18': 'Jijel',
  '19': 'Sétif',
  '20': 'Saïda',
  '21': 'Skikda',
  '22': 'Sidi Bel Abbès',
  '23': 'Annaba',
  '24': 'Guelma',
  '25': 'Constantine',
  '26': 'Médéa',
  '27': 'Mostaganem',
  '28': "M'Sila",
  '29': 'Mascara',
  '30': 'Ouargla',
  '31': 'Oran',
  '32': 'El Bayadh',
  '33': 'Illizi',
  '34': 'Bordj Bou Arréridj',
  '35': 'Boumerdès',
  '36': 'El Tarf',
  '37': 'Tindouf',
  '38': 'Tissemsilt',
  '39': 'El Oued',
  '40': 'Khenchela',
  '41': 'Souk Ahras',
  '42': 'Tipaza',
  '43': 'Mila',
  '44': 'Aïn Defla',
  '45': 'Naâma',
  '46': 'Aïn Témouchent',
  '47': 'Ghardaïa',
  '48': 'Relizane',
  '49': 'Timimoun',
  '50': 'Bordj Badji Mokhtar',
  '51': 'Ouled Djellal',
  '52': 'Béni Abbès',
  '53': 'In Salah',
  '54': 'In Guezzam',
  '55': 'Touggourt',
  '56': 'Djanet',
  '57': "El M'Ghair",
  '58': 'El Meniaa',
};

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _FindCraftsmenPageState();
}

class _FindCraftsmenPageState extends State<ServicePage> {
  String selectedTrade = 'Electrician';
  bool availableNow = true;
  String selectedWilaya = 'Alger'; // default wilaya

  // ---------- wilaya picker bottom sheet ----------
  void _showWilayaPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF161B1F),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _WilayaPickerSheet(
        onSelected: (wilaya) {
          setState(() {
            selectedWilaya = wilaya;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ---------- header ----------
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: _kAccent,
                        size: 26.0,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    const Text(
                      'Find Craftsmen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // TODO: open search
                      },
                      icon: const Icon(
                        Icons.search,
                        color: _kAccent,
                        size: 25.0,
                      ),
                    ),
                  ],
                ), // header
                const SizedBox(height: 14.0),

                // ---------- search pill ----------
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 15.0),
                  decoration: InputDecoration(
                    hintText: 'Search by trade or name...',
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide: BorderSide(color: Colors.white.withAlpha(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide: const BorderSide(color: _kAccent, width: 1.4),
                    ),
                  ),
                ), // search
                const SizedBox(height: 16.0),

                // ---------- trade chips ----------
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _tradeChip(Icons.bolt, 'Electrician'),
                      const SizedBox(width: 12.0),
                      _tradeChip(Icons.water_drop_outlined, 'Plumber'),
                      const SizedBox(width: 12.0),
                      _tradeChip(Icons.handyman_outlined, 'Carpenter'),
                      const SizedBox(width: 12.0),
                      _tradeChip(Icons.format_paint_outlined, 'Painter'),
                    ],
                  ),
                ), // chips
                const SizedBox(height: 16.0),

                // ---------- filters ----------
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _showWilayaPicker,
                        child: _filterPill(
                          selectedWilaya,
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: _filterPill('Rating 4.0+', Icons.star_border),
                    ),
                  ],
                ), // filters
                const SizedBox(height: 12.0),

                // ---------- available now toggle ----------
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16.0, right: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(10),
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(color: Colors.white.withAlpha(15)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Available Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Switch(
                          value: availableNow,
                          onChanged: (value) {
                            setState(() {
                              availableNow = value;
                            });
                          },
                          activeThumbColor: Colors.white,
                          activeTrackColor: _kAccent,
                        ),
                      ],
                    ),
                  ),
                ), // available now
                const SizedBox(height: 20.0),

                // ---------- craftsman cards ----------
                const _CraftsmanCard(
                  name: 'Ahmed Kerrouche',
                  trade: 'Master Electrician & Automation',
                  rating: '4.9',
                  jobs: '48 jobs completed',
                  city: 'Algiers',
                ),
                const SizedBox(height: 18.0),
                const _CraftsmanCard(
                  name: 'Samir Mansouri',
                  trade: 'Cabinet Maker & Woodwork',
                  rating: '4.8',
                  jobs: '32 jobs completed',
                  city: 'Oran',
                ),
              ], // children
            ), // Column
          ), // Padding
        ), // SingleChildScrollView
      ), // SafeArea
    ); // Scaffold
  }

  Widget _tradeChip(IconData icon, String label) {
    final bool selected = selectedTrade == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTrade = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: selected ? _kAccent : Colors.white.withAlpha(10),
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: selected ? _kAccent : Colors.white.withAlpha(15),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18.0,
              color: selected ? const Color(0xFF00262B) : Colors.white,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                color: selected ? const Color(0xFF00262B) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterPill(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.5,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(icon, color: Colors.white54, size: 20.0),
        ],
      ),
    );
  }
}

// ---------- searchable wilaya picker bottom sheet ----------
class _WilayaPickerSheet extends StatefulWidget {
  final void Function(String) onSelected;
  const _WilayaPickerSheet({required this.onSelected});

  @override
  State<_WilayaPickerSheet> createState() => _WilayaPickerSheetState();
}

class _WilayaPickerSheetState extends State<_WilayaPickerSheet> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final entries = algerianWilayas.entries
        .where((e) => e.value.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            Container(
              width: 40.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ), // drag handle
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Wilaya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.white, fontSize: 15.0),
                decoration: InputDecoration(
                  hintText: 'Search wilaya...',
                  hintStyle: const TextStyle(color: Colors.white38),
                  prefixIcon: const Icon(Icons.search, color: Colors.white38),
                  filled: true,
                  fillColor: Colors.white.withAlpha(10),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) => setState(() => query = value),
              ),
            ), // search field
            const SizedBox(height: 8.0),
            Expanded(
              child: entries.isEmpty
                  ? const Center(
                      child: Text(
                        'No wilaya found',
                        style: TextStyle(color: Colors.white38),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      itemCount: entries.length,
                      separatorBuilder: (_, _) => Divider(
                        color: Colors.white.withAlpha(10),
                        height: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return ListTile(
                          leading: SizedBox(
                            width: 28.0,
                            child: Text(
                              entry.key,
                              style: const TextStyle(
                                color: _kAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                          title: Text(
                            entry.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.5,
                            ),
                          ),
                          onTap: () => widget.onSelected(entry.value),
                        );
                      },
                    ),
            ), // list
          ],
        ),
      ),
    );
  }
}

class _CraftsmanCard extends StatelessWidget {
  const _CraftsmanCard({
    required this.name,
    required this.trade,
    required this.rating,
    required this.jobs,
    required this.city,
  });

  final String name;
  final String trade;
  final String rating;
  final String jobs;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white.withAlpha(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // avatar with online dot — replace with the craftsman photo:
              // CircleAvatar(backgroundImage: AssetImage(...))
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withAlpha(40)),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white.withAlpha(20),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 4,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _kOnline,
                        border: Border.all(
                          color: const Color(0xFF11181C),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ), // online dot
                ],
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: _kAccent.withAlpha(26),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: _kAccent.withAlpha(60)),
                          ),
                          child: const Text(
                            'VERIFIED',
                            style: TextStyle(
                              color: _kAccent,
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ), // verified badge
                        const SizedBox(width: 8.0),
                        const Icon(
                          Icons.bookmark_border,
                          color: Colors.white54,
                          size: 22.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      trade,
                      style: const TextStyle(
                        color: Color(0xFF9BC8CF),
                        fontSize: 15.0,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // rating • jobs • city
          Row(
            children: [
              const Icon(Icons.star_border, color: _kAccent, size: 17.0),
              const SizedBox(width: 4.0),
              Text(
                rating,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10.0),
              const Text('•', style: TextStyle(color: Colors.white24)),
              const SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  jobs,
                  style: const TextStyle(color: Colors.white54, fontSize: 13.0),
                ),
              ),
              const SizedBox(width: 10.0),
              const Text('•', style: TextStyle(color: Colors.white24)),
              const SizedBox(width: 10.0),
              Text(
                city,
                style: const TextStyle(color: Colors.white54, fontSize: 13.0),
              ),
            ],
          ), // stats
          const SizedBox(height: 14.0),

          // portfolio thumbnails — replace with each craftsman's photos
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/fonts/images/bg.jpg',
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/fonts/images/bg.jpg',
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/fonts/images/bg.jpg',
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ), // thumbnails
          const SizedBox(height: 14.0),

          // buttons
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: open the craftsman profile
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(10),
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white.withAlpha(20)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: const Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: FilledButton(
                    onPressed: () {
                      // TODO: open chat with this craftsman
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: _kAccent,
                      foregroundColor: const Color(0xFF00262B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline, size: 18.0),
                        SizedBox(width: 8.0),
                        Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ), // buttons
        ],
      ),
    );
  }
}
