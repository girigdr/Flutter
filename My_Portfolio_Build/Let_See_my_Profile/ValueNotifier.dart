

import 'package:flutter/material.dart';

import 'Contact.dart';
import 'Education.dart';
import 'Email.dart';
import 'Texhnologies.dart';
import 'resume.dart';
ValueNotifier education = ValueNotifier( false ) ;
ValueNotifier < bool > vn = ValueNotifier( false ) ;
ValueNotifier < int > swipeUP = ValueNotifier( 0 ) ;
ValueNotifier < bool > iconToShowFurtherDetailOfEducation1 = ValueNotifier( false ) ;
ValueNotifier < bool > iconToShowFurtherDetailOfEducation2 = ValueNotifier( false ) ;
ValueNotifier < bool > iconToShowFurtherDetailOfEducation3 = ValueNotifier( false ) ;
ValueNotifier < bool > up_or_down = ValueNotifier( false ) ;




// late ValueNotifier < double > h1  ;
// late ValueNotifier < double > w1  ;

ValueNotifier < int > color = ValueNotifier( 0 ) ;

List < Widget > detailPage = [ Education() , Technologies() , Resumea() , Contact() , Email() ] ;


