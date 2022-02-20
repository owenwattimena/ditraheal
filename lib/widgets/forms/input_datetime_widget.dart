part of "../widgets.dart";

class InputDatetimeWidget extends StatelessWidget {
  final String? label;
  final Function(DateTime)? onDateSelected;
  final Function(DateTime?)? validator;
  InputDatetimeWidget({this.label, this.onDateSelected, this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(horizontal: 11),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      child: DateTimeFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          // border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(top: 15),
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
