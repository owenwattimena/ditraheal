part of "../widgets.dart";

class InputWidget extends StatelessWidget {
  final String? label, hintText;
  final TextEditingController? textController;
  final void Function(String)? onChanged;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;

  InputWidget({this.label, this.hintText, this.textController, this.onChanged, this.validator, this.keyboardType, this.textCapitalization});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (label != null) ? Container(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 4),
          child: Text(label ?? ""),
        ) : SizedBox(),
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
            keyboardType: keyboardType ?? TextInputType.text,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            validator: (val) => validator!(val!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5),
              // border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.black45),
              hintText: hintText,
              errorStyle: TextStyle(color: Colors.redAccent),
            ),
            textInputAction: TextInputAction.next, 
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
