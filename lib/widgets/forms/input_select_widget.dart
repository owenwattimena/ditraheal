part of "../widgets.dart";

class InputSelectWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? value;
  final List<String> options;
  final double? top;
  final Function(String?) onChanged;
  final Function(String?)? validator;
  const InputSelectWidget(
      {Key? key,
      this.label,
      this.hint,
      this.value,
      required this.options,
      required this.onChanged, this.top,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: top ?? 8),
          padding: EdgeInsets.fromLTRB(24, 0, 24, 4),
          child: Text(label ?? ""),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(24, 0, 24, 4),
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            value: value,
            // underline: SizedBox(),
            hint: Text(hint ?? ""),
            validator: (val) => (validator!= null) ? validator!(val) : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            items: options.map((val) {
              return DropdownMenuItem<String>(
                child: Text(val),
                value: val,
              );
            }).toList(),
            onChanged: (val) => onChanged(val),
            decoration: InputDecoration(
              filled: true,
              fillColor: greyColor,
              contentPadding: EdgeInsets.only(top: 25, left:11, right: 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide.none,
              ),
              errorStyle: TextStyle(color: Colors.redAccent),
            )
          ),
        ),
      ],
    );
  }
}
