import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17),
      decoration: InputDecoration(
        filled: true,
        // fillColor: Theme.of(context).colorScheme.primaryVariant,
        contentPadding: EdgeInsets.zero,
        // hintMaxLines: 2,
        hintText: 'Search',
        hintStyle:
            Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17),
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 17,
          icon: const Icon(
            Icons.highlight_remove,
            // size: 17,
          ),
          onPressed: () {},
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 17,
          // color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
