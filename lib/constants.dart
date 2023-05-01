import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/screen/add/add_video_page.dart';
import 'package:tiktok/screen/house/hoome_page.dart';
import 'package:tiktok/screen/api/auth_controller.dart';

const pages = [
  HoomePage(),
  AddVideoPage(), //1:18:13
  Text('Profile Page'),
];

//Connection to firebase through variables

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//controller
var authController = AuthController.instance;