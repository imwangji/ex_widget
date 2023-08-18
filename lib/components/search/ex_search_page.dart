import 'package:ex_widget/components/card/ex_card.dart';
import 'package:ex_widget/components/divider/ex_divider.dart';
import 'package:ex_widget/components/input_box/ex_input_box.dart';
import 'package:ex_widget/extensions/padding.extension.dart';
import 'package:flutter/material.dart';

enum EXSearchPageState {
  defaultState,
  showSuggestion,
  showResult,
  noResult,
  error,
  loading,
}

class EXSearchPage extends StatefulWidget {
  final EXSearchPageState? state;
  final String? hintText;
  final Function(String)? onSearch;
  final Function(String)? onChange;
  final Widget Function(BuildContext, String, int index) suggestionItemBuilder;
  final Widget Function(BuildContext, String)? resultPageBuilder;
  final Widget Function(BuildContext, String)? emptyPageBuilder;
  final Widget Function(BuildContext, String)? errorPageBuilder;
  final Widget Function(BuildContext, String)? loadingPageBuilder;
  final int? resultCount;
  final int? suggestionCount;

  const EXSearchPage({
    super.key,
    this.state = EXSearchPageState.defaultState,
    this.hintText,
    this.onSearch,
    this.onChange,
    required this.suggestionItemBuilder,
    this.resultPageBuilder,
    this.emptyPageBuilder,
    this.errorPageBuilder,
    this.loadingPageBuilder,
    this.resultCount = 0,
    this.suggestionCount = 0,
  });

  @override
  State<EXSearchPage> createState() => _EXSearchPageState();
}

class _EXSearchPageState extends State<EXSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      if (widget.onChange != null) {
        widget.onChange!(_searchController.text);
      }
    });
  }

  buildMain() {
    if (widget.state == EXSearchPageState.loading) {
      return widget.loadingPageBuilder?.call(context, _searchController.text) ?? const Center(child: CircularProgressIndicator());
    }
    if (widget.state == EXSearchPageState.showSuggestion) {
      return EXCard(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => widget.suggestionItemBuilder(context, _searchController.text, index),
          separatorBuilder: (context, index) => const EXDivider(),
          itemCount: widget.suggestionCount ?? 0,
        ),
      ).py(6);
    }
    if (widget.state == EXSearchPageState.showResult) {
      return widget.resultPageBuilder?.call(context, _searchController.text) ?? Container();
    }
    if (widget.state == EXSearchPageState.noResult) {
      return widget.emptyPageBuilder?.call(context, _searchController.text) ?? Container();
    }
    if (widget.state == EXSearchPageState.error) {
      return widget.errorPageBuilder?.call(context, _searchController.text) ?? Container();
    }
    return Container();
  }

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
            textInputAction: TextInputAction.search,
            onSubmitted: widget.onSearch,
          ),
          buildMain(),
        ],
      ),
    );
  }
}
