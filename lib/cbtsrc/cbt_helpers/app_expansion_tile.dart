import 'package:flutter/material.dart';

const Duration _kExpand = const Duration(milliseconds: 200);

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    Key? key,
    required this.onExpansionChanged,
    this.leading,
    required this.title,
    this.backgroundColor,
    this.children= const <Widget>[],
    this.trailing,
    this.initiallyExpanded= false,
    this.headerColor,
    this.subtitle,
    this.isDense = false,
    this.icons = Icons.expand_more,
  })  : assert(initiallyExpanded != null),
        super(key: key);
  final Widget? leading;
  final Widget title;
  final ValueChanged<bool> onExpansionChanged;
  final List<Widget> children;
  final Color? backgroundColor;
  final Widget? trailing;
  final bool initiallyExpanded;
  final Color? headerColor;
  final Widget? subtitle;
  final bool isDense;
  final IconData icons;

  @override
  AppExpansionTileState createState() => new AppExpansionTileState();
}

class AppExpansionTileState extends State<AppExpansionTile>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  CurvedAnimation? _easeOutAnimation;
  CurvedAnimation? _easeInAnimation;
  ColorTween? _borderColor;
  ColorTween? _headerColor;
  ColorTween? _iconColor;
  ColorTween? _backgroundColor;
  Animation<double>? _iconTurns;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(duration: _kExpand, vsync: this);
    _easeOutAnimation =
        new CurvedAnimation(parent: _controller!, curve: Curves.easeOut);
    _easeInAnimation =
        new CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
    _borderColor = new ColorTween();
    _headerColor = new ColorTween();
    _iconColor = new ColorTween();
    _iconTurns =
        new Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation!);
    _backgroundColor = new ColorTween();

    _isExpanded =
        PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller!.value = 1.0;
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void expand() {
    _setExpanded(true);
  }

  void collapse() {
    _setExpanded(false);
  }

  void toggle() {
    _setExpanded(!_isExpanded);
  }

  bool get isExpended => _isExpanded;

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded)
          _controller!.forward();
        else
          _controller!.reverse().then<void>((value) {
            setState(() {
              // Rebuild without widget.children.
            });
          });
        PageStorage.of(context)?.writeState(context, _isExpanded);
      });
      if (widget.onExpansionChanged != null) {
        widget.onExpansionChanged(_isExpanded);
      }
    }
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final Color borderSideColor =
        _borderColor!.evaluate(_easeOutAnimation!) ?? Colors.transparent;
    final Color titleColor = _headerColor!.evaluate(_easeInAnimation!)!;

    return new Container(
      decoration: new BoxDecoration(
          color: _backgroundColor!.evaluate(_easeOutAnimation!) ??
              Colors.transparent,
          border: new Border(
            top: new BorderSide(color: borderSideColor),
            bottom: new BorderSide(color: borderSideColor),
          )),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme.merge(
            data: IconThemeData(color: _iconColor!.evaluate(_easeInAnimation!)),
            child: Container(
              child: ListTile(
                dense: widget.isDense,
                contentPadding: widget.isDense
                    ? EdgeInsets.only(left: 8.0, right: 8)
                    : null,
                tileColor: _isExpanded ? widget.headerColor : null,
                onTap: toggle,
                leading: widget.leading,
                title: new DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: titleColor),
                  child: widget.title,
                ),
                trailing: widget.trailing ??
                    new RotationTransition(
                      turns: _iconTurns!,
                      child: Icon(widget.icons),
                    ),
                subtitle: widget.subtitle,
              ),
            ),
          ),
          new ClipRect(
            child: new Align(
              heightFactor: _easeInAnimation!.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor!.end = theme.dividerColor;
    _headerColor!
      ..begin = theme.textTheme.subtitle1!.color
      ..end = theme.primaryColor;
    _iconColor!
      ..begin = theme.unselectedWidgetColor
      ..end = theme.primaryColor;
    _backgroundColor!.end = widget.backgroundColor;

    final bool closed = !_isExpanded && _controller!.isDismissed;
    return new AnimatedBuilder(
      animation: _controller!.view,
      builder: _buildChildren,
      child: closed ? null : new Column(children: widget.children),
    );
  }
}
