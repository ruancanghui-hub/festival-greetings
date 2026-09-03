import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  static const _ink = Color(0xFF0C2439);
  static const _paper = Color(0xFFF6F0E4);
  static const _vermilion = Color(0xFFC84B3A);

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const _FestivalHome(),
      const _CreateGreeting(),
      const _MyGreetings(),
    ];

    return Scaffold(
      backgroundColor: _ink,
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF102C43),
        indicatorColor: _vermilion.withValues(alpha: 0.22),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '首页',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_outlined),
            selectedIcon: Icon(Icons.edit),
            label: '创作',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
}

class _FestivalHome extends StatelessWidget {
  const _FestivalHome();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          '情寄佳节 心意相连',
          style: TextStyle(
            color: _HomePageState._paper,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text('用一张卡片，传递祝福与思念', style: TextStyle(color: Color(0xFFD5C7B1))),
        const SizedBox(height: 20),
        const _PaperCard(
          child: Row(
            children: [
              Icon(Icons.nightlight_round, color: _HomePageState._vermilion),
              SizedBox(width: 10),
              Text('距中秋还有 12 天'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const _SectionTitle('为谁送祝福'),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _RelationChip('父母'),
            _RelationChip('爱人'),
            _RelationChip('朋友'),
            _RelationChip('同事'),
            _RelationChip('老师'),
            _RelationChip('孩子'),
          ],
        ),
        const SizedBox(height: 24),
        const _SectionTitle('精选模板'),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(child: _TemplateTile('中秋快乐')),
            SizedBox(width: 10),
            Expanded(child: _TemplateTile('万事顺意')),
          ],
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: null,
          icon: const Icon(Icons.auto_awesome),
          label: const Text('AI 智能祝福卡'),
        ),
      ],
    );
  }
}

class _CreateGreeting extends StatelessWidget {
  const _CreateGreeting();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Text(
          '创作祝福',
          style: TextStyle(
            color: _HomePageState._paper,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text('选择对象 · 写下心意 · 制作贺卡', style: TextStyle(color: Color(0xFFD5C7B1))),
        SizedBox(height: 24),
        _SectionTitle('送给谁'),
        SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _RelationChip('父母', selected: true),
            _RelationChip('爱人'),
            _RelationChip('朋友'),
            _RelationChip('同事'),
          ],
        ),
        SizedBox(height: 24),
        _SectionTitle('什么场景'),
        SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _RelationChip('中秋'),
            _RelationChip('生日'),
            _RelationChip('感谢'),
            _RelationChip('日常'),
          ],
        ),
        SizedBox(height: 24),
        _PaperCard(
          child: Text(
            '想说的话（选填）\n\n最多 50 字',
            style: TextStyle(color: Color(0xFF5F5A52)),
          ),
        ),
        SizedBox(height: 20),
        FilledButton(onPressed: null, child: Text('生成祝福文案')),
      ],
    );
  }
}

class _MyGreetings extends StatelessWidget {
  const _MyGreetings();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Text(
          '我的祝福',
          style: TextStyle(
            color: _HomePageState._paper,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text('把心意好好收藏', style: TextStyle(color: Color(0xFFD5C7B1))),
        SizedBox(height: 24),
        Row(
          children: [
            Expanded(child: _PaperCard(child: Text('我的文案\n12'))),
            SizedBox(width: 12),
            Expanded(child: _PaperCard(child: Text('收藏贺卡\n8'))),
          ],
        ),
        SizedBox(height: 24),
        _SectionTitle('我的文案'),
        SizedBox(height: 12),
        _PaperCard(
          child: Column(
            children: [_ListRow('中秋问候'), _ListRow('生日祝福'), _ListRow('感谢老师')],
          ),
        ),
        SizedBox(height: 24),
        _SectionTitle('收藏'),
        SizedBox(height: 12),
        _PaperCard(child: Text('已收藏的贺卡将在这里展示')),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      color: _HomePageState._paper,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );
}

class _RelationChip extends StatelessWidget {
  const _RelationChip(this.label, {this.selected = false});
  final String label;
  final bool selected;
  @override
  Widget build(BuildContext context) => Chip(
    label: Text(label),
    backgroundColor: selected
        ? _HomePageState._vermilion
        : _HomePageState._paper,
    labelStyle: TextStyle(color: selected ? Colors.white : _HomePageState._ink),
    side: BorderSide.none,
  );
}

class _TemplateTile extends StatelessWidget {
  const _TemplateTile(this.label);
  final String label;
  @override
  Widget build(BuildContext context) => Container(
    height: 88,
    alignment: Alignment.bottomLeft,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: _HomePageState._vermilion.withValues(alpha: 0.8),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: _HomePageState._paper,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class _PaperCard extends StatelessWidget {
  const _PaperCard({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: _HomePageState._paper,
      borderRadius: BorderRadius.circular(18),
    ),
    child: child,
  );
}

class _ListRow extends StatelessWidget {
  const _ListRow(this.label);
  final String label;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(label),
    trailing: const Icon(Icons.chevron_right),
  );
}
