import 'package:flutter/material.dart';


import 'model/menu_model.dart';
import 'widgets/editable_table_cell.widget.dart';



//?  ** this widget is used to display the table of KOT items ***/
//?  ** it takes a list of rows and a function to update the row ***/
//?  ** it uses a horizontal scroll view to allow for scrolling through the table ***/

class KotTableWidget extends StatelessWidget {
  final List<Map<String, String>> rows;
  final Function(int, String, String) onUpdate;
  final ScrollController _scrollController = ScrollController();

  KotTableWidget({super.key, required this.rows, required this.onUpdate});
  // ** This is the list of menu items for suggestions ***/
  // ** it is used to display the suggestions when the user types in the code field ***/
  // ** it is a list of MenuItem objects ***/
  // ** each MenuItem object has a code and an item name ***/
  // ** the code is used to identify the item and the item name is used to display the name of the item ***/
  // ** the list is hardcoded for now, but it can be replaced with a dynamic list from the database ***/
  // ** the list is used to display the suggestions when the user types in the code field ***/

  // final List<MenuItem> menuItems = [
  //   MenuItem.fromCode('106'),
  //   MenuItem.fromCode('2'),
  //   MenuItem.fromCode('3'),
  //   MenuItem.fromCode('4'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: false,

      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            //** This is the header row ***/
            _buildHeaderRow(),
            const Divider(height: 1, color: Colors.black),
            ...rows.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> row = entry.value;
              //** This is the data row ***/
              return _buildDataRow(context, index, row);
            }),
          ],
        ),
      ),
    );
  }

  //? ** This is the header row ***/
  Widget _buildHeaderRow() {
    return Container(
      color: Colors.indigo,
      child: Row(
        children: const [
          _TableCell(text: "Code", width: 100, isHeader: true),
          _TableCell(text: "ITEM NAME", width: 200, isHeader: true),
          _TableCell(text: "QTY", width: 80, isHeader: true),
          _TableCell(text: "RATE", width: 80, isHeader: true),
          _TableCell(text: "REMARKS", width: 180, isHeader: true),
        ],
      ),
    );
  }

  //? ** This is the data row ***/
  Widget _buildDataRow(
    BuildContext context,
    int index,
    Map<String, String> row,
  ) {
    final code = row["code"]!;

    final isCodeLocked = false; // Always editable now
   // final menuItem = MenuItem.fromCode(code);

    return Row(
      children: [
        //*------- code field with suggestions
        EditableCell(
          initialValue: code,
          width: 100,
          onSubmitted: (val) {
            // context.read<KotBloc>().add(
            //   SelectCodeAndFillRow(index: index, code: val),
            // );
          },
          isEnabled: !isCodeLocked,
          isCodeField: true,
         // menuItems: menuItems, // Pass the list of menu items here
        ),
        //*----- item name field
        EditableCell(
          initialValue: row["itemName"]!,
          width: 200,
          onSubmitted:(val){},
              // (val) => context.read<KotBloc>().add(
              //   UpdateKotRow(index, {...row, "itemName": val}),
              // ),
          isEnabled: false,
        ),
        // *----------quantity field
        EditableCell(
          initialValue: row["qty"]!,
          width: 80,
          onSubmitted:(val){}
              // (val) =>
              //  context.read<KotBloc>().add(
              //   UpdateKotRow(index, {...row, "qty": val}),
              // ),
        ),
        //*---------- rate field
        EditableCell(
          initialValue: row["rate"]!,
          width: 80,
          onSubmitted:(val){}
              // (val) => context.read<KotBloc>().add(
              //   UpdateKotRow(index, {...row, "rate": val}),
              // ),
        ),
        //*--------- remarks field
        EditableCell(
          initialValue: row["remarks"]!,
          width: 180,
          onSubmitted:(val){}
              // (val) => context.read<KotBloc>().add(
              //   UpdateKotRow(index, {...row, "remarks": val}),
              // ),
        ),
      ],
    );
  }
}

//? ** This is the table cell widget ***/
//? ** it is used to display the header and data cells ***/
//? ** it takes the text, width and isHeader as parameters ***/
//? ** it is used to display the text in the cell ***/
//? ** it is used to display the header and data cells ***/
//? ** it takes the text, width and isHeader as parameters ***/
//? ** it is used to display the text in the cell ***/
//? ** it is used to display the header and data cells ***/

class _TableCell extends StatelessWidget {
  final String text;
  final double width;
  final bool isHeader;

  const _TableCell({
    required this.text,
    required this.width,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    //*  table cell widget ***/
    return Container(
      width: width,
      height: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(146, 133, 131, 131)),
        color: isHeader ? Colors.indigo : Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isHeader ? Colors.white : Colors.black,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
