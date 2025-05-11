import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool centerTitle;

  const CustomAppbar({
    super.key, 
    required this.title, 
    this.actions, this.leading, 
    this.bottom,
    required this.centerTitle, });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: centerTitle,
        title: Text(title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent.shade200, 
                Color.fromARGB(255, 159, 212, 255), 
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
    //         boxShadow: [
    //   BoxShadow(
    //     color: Colors.black.withOpacity(0.2),
    //     offset: const Offset(0, 2),
    //     blurRadius: 8,
    //   ),
    // ],
          ),
        ),
        actions: actions,
        leading: leading,
        bottom: bottom,
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
    );
  }
  
  @override
  Size get preferredSize
   {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}