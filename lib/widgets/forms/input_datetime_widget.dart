part of "../widgets.dart";

class InputDatetimeWidget extends StatelessWidget {
  final String? label;
  final Function(DateTime)? onDateSelected;
  final Function(DateTime?)? validator;
  final DateTime? initialDate;
  InputDatetimeWidget({this.label, this.onDateSelected, this.validator, this.initialDate});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      
      child: DateTimeFormField(
        initialDate: initialDate,
        decoration: InputDecoration(
          filled: true,
          fillColor: greyColor,
          contentPadding: EdgeInsets.only(top: 30, left: 11, right: 11),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide.none,
          ),
          hintText: 'Tanggal Lahir',
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          // border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.event_note),
          // labelText: 'Tanggal Lahir',
        ),
        lastDate: DateTime.now(),
        mode: DateTimeFieldPickerMode.date,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (datetime) => validator!(datetime),
        onDateSelected: (DateTime value) {
          onDateSelected!(value);
        },
      ),
    );
  }
}
