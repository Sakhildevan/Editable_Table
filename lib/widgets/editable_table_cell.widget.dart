import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../model/menu_model.dart';

//? ** This is the editable cell widget ***/
//? ** it is used to display the editable cells in the table ***/
//? ** it takes the initial value, width, onSubmitted and isEnabled as parameters ***/
//? ** it is used to display the text field in the cell ***/

class EditableCell extends StatelessWidget {
  final String initialValue;
  final double width;
  final ValueChanged<String> onSubmitted;
  final bool isEnabled;
  final bool isCodeField;
  final List<MenuItem> menuItems; // List of menu items for suggestions

  const EditableCell({
    super.key,
    required this.initialValue,
    required this.width,
    required this.onSubmitted,
    this.isEnabled = true,
    this.isCodeField = false,
    this.menuItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialValue);

    return Container(
      width: width,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(146, 181, 179, 179)),
      ),
      child:
          isCodeField
              //*--------- code field with suggestions  -----------
              ? TypeAheadFormField<MenuItem>(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: controller,
                  enabled: isEnabled,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 12),
                  ),
                ),
                hideOnEmpty: true,
                hideOnLoading: true,
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  offsetX: 0,
                  constraints: BoxConstraints(
                    minWidth: 150, // Adjust this width as needed
                  ),
                  elevation: 4,
                  color: Colors.white,
                ),
                suggestionsCallback: (pattern) {
                  return menuItems.where(
                    (item) =>
                        item.itemName.toLowerCase().contains(
                          pattern.toLowerCase(),
                        ) ||
                        item.code.contains(pattern),
                  );
                },
                itemBuilder: (context, MenuItem suggestion) {
                  return Material(
                    child: ListTile(
                      title: Text(suggestion.itemName),
                      subtitle: Text('Code: ${suggestion.code}'),
                    ),
                  );
                },
                onSuggestionSelected: (MenuItem suggestion) {
                  controller.text = suggestion.code;
                  onSubmitted(suggestion.code);
                },
              )
              //*--------- other fields  -----------
              //? ** this is the editable cell widget ***/
              : TextField(
                controller: controller,
                enabled: isEnabled,
                onSubmitted: onSubmitted,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 12),
                ),
              ),
    );
  }
}
