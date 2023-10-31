import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/model/number.dart';
import 'package:contact_list/screen/contact_list.dart';

var contactList = [
  ContactInfo(
    firstName: 'Tony',
    lastName: 'Stark',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Thor',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Steven',
    lastName: 'Rogers',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Clinton',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Jessie',
    lastName: 'Mendez',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Ariana',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Steven',
    lastName: 'Hawking',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Mary',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
    emergencyContact: false,
  ),
  ContactInfo(
    firstName: 'Joseph',
    lastName: 'Dela Cruz',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
    emergencyContact: true,
  ),
  ContactInfo(
    firstName: 'Tina',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
    emergencyContact: false,
  ),
  ContactInfo(
    firstName: 'Jahel',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
    emergencyContact: true,
  ),
  ContactInfo(
    firstName: 'Clinton',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
    emergencyContact: true,
  ),
  ContactInfo(
    firstName: 'Jessie',
    lastName: 'Mendez',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Ariana',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
  ContactInfo(
    firstName: 'Steven',
    lastName: 'Hawking',
    contactNumber: const [NumberList(NumberTypes.Phone, '0909090')],
  ),
];
