import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static final SCREEN = "FilterScreen";
  final Function applyFilter;
  final Map<String, bool> filters;

  FilterScreen(this.filters, this.applyFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  initState() {
    _glutenFree = widget.filters["glutenfree"];
    _vegetarian = widget.filters["vegetarian"];
    _vegan = widget.filters["vegan"];
    _lactoseFree = widget.filters["lactosefree"];
  }

  Widget _getFilterViewFor(
      {bool filterType, String title, String subTitle, Function update}) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      value: filterType,
      subtitle: Text(
        subTitle,
      ),
      onChanged: (newValue) {
        update(newValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          TextButton(
            child: Text("Save"),
            onPressed: () => widget.applyFilter({
              "vegetarian": this._vegetarian,
              "vegan": this._vegan,
              "lactosefree": this._lactoseFree,
              "glutenfree": this._glutenFree,
            }),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _getFilterViewFor(
                  filterType: _vegetarian,
                  title: "Only Vegetarian",
                  subTitle: "Will show you only vegetarian meals",
                  update: (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  }),
              _getFilterViewFor(
                  filterType: _vegan,
                  title: "Only Vegan",
                  subTitle: "Will show you only vegan meals",
                  update: (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  }),
              _getFilterViewFor(
                  filterType: _glutenFree,
                  title: "Only Gluten Free",
                  subTitle: "Will show you only gluten free meals",
                  update: (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }),
              _getFilterViewFor(
                  filterType: _lactoseFree,
                  title: "Only Lactose Free",
                  subTitle: "Will show you only lactose free meals",
                  update: (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
