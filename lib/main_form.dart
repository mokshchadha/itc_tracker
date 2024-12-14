import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SalesFormScreen extends StatefulWidget {
  @override
  _SalesFormScreenState createState() => _SalesFormScreenState();
}

class _SalesFormScreenState extends State<SalesFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Keys for dropdowns
  final GlobalKey<DropdownSearchState<String>> _teamLeadKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _salesmanKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _outletNameKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _numPacketsKey = GlobalKey();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Get selected values
      final teamLead = _teamLeadKey.currentState?.getSelectedItem;
      final salesman = _salesmanKey.currentState?.getSelectedItem;
      final outletName = _outletNameKey.currentState?.getSelectedItem;
      final numPackets = _numPacketsKey.currentState?.getSelectedItem;

      // Print values or send to backend
      print('Team Lead: $teamLead');
      print('Salesman: $salesman');
      print('Outlet Name: $outletName');
      print('Number of Packets: $numPackets');

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );

      // Reset dropdowns
      _teamLeadKey.currentState?.clear();
      _salesmanKey.currentState?.clear();
      _outletNameKey.currentState?.clear();
      _numPacketsKey.currentState?.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownSearch<String>(
                key: _teamLeadKey,
                selectedItem: "Select Team Lead",
                items: (filter, _) =>
                    ["Team Lead A", "Team Lead B", "Team Lead C"],
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Examples for: ',
                    border: OutlineInputBorder(),
                  ),
                ),
                popupProps: PopupProps.menu(fit: FlexFit.loose),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a team lead';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownSearch<String>(
                key: _salesmanKey,
                selectedItem: "Select Salesman",
                items: (filter, _) =>
                    ["Salesman A", "Salesman B", "Salesman C"],
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Examples for: ',
                    border: OutlineInputBorder(),
                  ),
                ),
                popupProps: PopupProps.menu(fit: FlexFit.loose),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a salesman';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownSearch<String>(
                key: _outletNameKey,
                selectedItem: "Select Outlet Name",
                items: (filter, _) => ["Outlet A", "Outlet B", "Outlet C"],
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Examples for: ',
                    border: OutlineInputBorder(),
                  ),
                ),
                popupProps: PopupProps.menu(fit: FlexFit.loose),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an outlet name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownSearch<String>(
                key: _numPacketsKey,
                selectedItem: "Select Number of Packets",
                items: (filter, _) => ["1", "2", "3", "4", "5"],
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Examples for: ',
                    border: OutlineInputBorder(),
                  ),
                ),
                popupProps: PopupProps.menu(fit: FlexFit.loose),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the number of packets';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
