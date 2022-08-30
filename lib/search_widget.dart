import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  const SearchWidget(
      {Key? key,
      required this.text,
      required this.onChanged,
      required this.hintText})
      : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      controller.clear();
                      widget.onChanged('');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                : null,
            hintText: widget.hintText,
            border: InputBorder.none),
        onChanged: widget.onChanged,
      ),
    );
  }
}
