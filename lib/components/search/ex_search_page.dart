import 'package:ex_widget/components/input_box/ex_input_box.dart';
import 'package:flutter/material.dart';

class EXSearchPage extends StatefulWidget {
  final String? hintText;
  final bool? isLoading;
  final Function(String)? onSearch;
  final Function(String)? onChange;
  final Widget Function(BuildContext, String)? suggestionItemBuilder;
  final Widget Function(BuildContext, String)? resultPageBuilder;
  final Widget Function(BuildContext, String)? emptyPageBuilder;
  final Widget Function(BuildContext, String)? errorPageBuilder;
  final Widget Function(BuildContext, String)? loadingPageBuilder;
  const EXSearchPage({
    super.key,
    this.hintText,
    this.isLoading,
    this.onSearch,
    this.onChange,
    this.suggestionItemBuilder,
    this.resultPageBuilder,
    this.emptyPageBuilder,
    this.errorPageBuilder,
    this.loadingPageBuilder,
  });

  @override
  State<EXSearchPage> createState() => _EXSearchPageState();
}

class _EXSearchPageState extends State<EXSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          EXInputBox(
            controller: _searchController,
            hintText: widget.hintText ?? "",
            prefix: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
