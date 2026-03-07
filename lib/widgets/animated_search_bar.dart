import 'package:flutter/material.dart';
import '../utils/theme.dart';

class AnimatedSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const AnimatedSearchBar({super.key, required this.onSearch});

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  bool _isExpanded = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _widthAnimation = Tween<double>(
      begin: 55,
      end: double.infinity,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) {
        if (_searchController.text.isEmpty) {
          _controller.reverse();
          setState(() => _isExpanded = false);
        }
      },
      child: GestureDetector(
        onTap: () {
          setState(() => _isExpanded = true);
          _controller.forward();
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: _isExpanded ? double.infinity : _widthAnimation.value,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(51),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  if (_isExpanded) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search destinations...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        onSubmitted: widget.onSearch,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune, color: Colors.grey),
                      onPressed: () {
                        // Show filters
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
