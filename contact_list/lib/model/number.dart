
enum NumberTypes {
  Mobile,
  Phone,
  Work,
  Main,
  Fax,
  Pager,
  Custom,
  Other,
}

class Number {
 const Number(this.typeName, this.digit);
  final String typeName;
  final String digit;
}
