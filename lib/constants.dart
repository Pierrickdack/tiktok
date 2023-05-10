import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/screen/add/add_video_page.dart';
import 'package:tiktok/screen/add/profile_screen.dart';
import 'package:tiktok/screen/api/auth_controller.dart';
import 'package:tiktok/screen/house/hoome_page.dart';

List pages = [
  HoomePage(),
  const AddVideoPage(),
  ProfileScreen(uid: authController.user.uid),
];

//Connection to firebase through variables

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//controller
var authController = AuthController.instance;


// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

