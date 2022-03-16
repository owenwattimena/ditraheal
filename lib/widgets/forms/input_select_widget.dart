part of "../widgets.dart";

class InputSelectWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? value;
  final List<String> options;
  final double? top;
  final Function(String?) onChanged;
  const InputSelectWidget(
      {Key? key,
      this.label,
      this.hint,
      this.value,
      required this.options,
      required this.onChanged, this.top})
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
          height: 50,
          margin: EdgeInsets.fromLTRB(24, 0, 24, 4),
          padding: EdgeInsets.symmetric(horizontal: 11),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            underline: SizedBox(),
            hint: Text(hint ?? ""),
            items: options.map((val) {
              return DropdownMenuItem<String>(
                child: Text(val),
                value: val,
              );
            }).toList(),
            onChanged: (val) => onChanged(val),
          ),
        ),
      ],
    );
  }
}
