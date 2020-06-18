import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filter;


  FilterScreen(this.filter, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filter['gluten'];
    _vegetarian = widget.filter['vegetarian'];
    _vegan = widget.filter['vegan'];
    _lactoseFree = widget.filter['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegetarian' : _vegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  value: _glutenFree,
                  subtitle: Text('Only include gluten-free meals.'),
                  onChanged: (newValue){
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: _vegetarian,
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (newValue){
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: _vegan,
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (newValue){
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-Free'),
                  value: _lactoseFree,
                  subtitle: Text('Only include lactose-free meals.'),
                  onChanged: (newValue){
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
