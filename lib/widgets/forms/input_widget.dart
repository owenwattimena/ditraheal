part of "../widgets.dart";

class InputWidget extends StatelessWidget {
  final String? label, hintText;
  final TextEditingController? textController;
  final Function(String)? onChanged;
  final Function(String)? validator;

  InputWidget({this.label, this.hintText, this.textController, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 4),
          child: Text("${label}"),
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
          child: TextFormField(
            controller: textController,
            validator: (val) => validator!(val!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '${hintText}',
              errorStyle: TextStyle(color: Colors.redAccent),
            ),
            onChanged: (val) => onChanged!(val),
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
