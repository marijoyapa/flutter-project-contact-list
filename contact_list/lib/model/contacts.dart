class ContactInfo {
  ContactInfo({
    required this.firstName,
    this.lastName,
    this.imageUrl,
    required this.contactNumber,
    bool? emergencyContact,
  }) : emergencyContact = emergencyContact == null ? false : emergencyContact;


  final String firstName;
  final String? lastName;
  final String? imageUrl;
  final int contactNumber;
  bool emergencyContact;
}
