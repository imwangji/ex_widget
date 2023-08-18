import 'package:ex_widget/components/input_box/ex_input_box.dart';
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
  final Widget Function(BuildContext, String)? suggestionItemBuilder;
  final Widget Function(BuildContext, String)? resultPageBuilder;
  final Widget Function(BuildContext, String)? emptyPageBuilder;
  final Widget Function(BuildContext, String)? errorPageBuilder;
  final Widget Function(BuildContext, String)? loadingPageBuilder;

  const EXSearchPage({
    super.key,
    this.state = EXSearchPageState.defaultState,
    this.hintText,
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
  EXSearchPageState _state = EXSearchPageState.defaultState;
  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _state = EXSearchPageState.showSuggestion;
      });
      if (widget.onChange != null) {
        widget.onChange!(_searchController.text);
      }
    });
  }

  buildMain() {
    if (_state == EXSearchPageState.loading) {
      return widget.loadingPageBuilder?.call(context, _searchController.text) ?? const Center(child: CircularProgressIndicator());
    }
    if (_state == EXSearchPageState.showSuggestion) {
      return widget.suggestionItemBuilder?.call(context, _searchController.text) ?? Container();
    }
    if (_state == EXSearchPageState.showResult) {
      return widget.resultPageBuilder?.call(context, _searchController.text) ?? Container();
    }
    if (_state == EXSearchPageState.noResult) {
      return widget.emptyPageBuilder?.call(context, _searchController.text) ?? Container();
    }
    if (_state == EXSearchPageState.error) {
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
