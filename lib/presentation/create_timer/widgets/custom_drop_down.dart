part of create_timer;

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    required this.items,
    required this.onTap,
  });

  final String title;
  final List<String> items;
  final Function(String) onTap;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _expandAnimation;

  late final Tween<double> _sizeTween;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
    _sizeTween = Tween(begin: 0, end: 1);
  }

  void _expandOnChanged() {
    _isExpanded = !_isExpanded;
    _isExpanded ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: _expandOnChanged,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrow_down_ic.svg',
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _sizeTween.animate(_expandAnimation),
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.items.length,
                separatorBuilder: (context, index) => Divider(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _isExpanded = false;
                      _controller.reverse();
                      widget.onTap(widget.items[index]);
                    },
                    splashColor: Colors.transparent,
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      widget.items[index],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
