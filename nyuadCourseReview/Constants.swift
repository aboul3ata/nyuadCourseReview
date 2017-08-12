//
//  Constants.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/8/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import Foundation
import UIKit

var majors:[String: String] = [
    "ANTH-UH":"Anthropology",
    "ACS-UH":"Arab Crossroads",
    "ARABL-UH":"Arabic language",
    "BIOL-UH":"Biology",
    "BUSOR-UH":"Business & Organization",
    "CHEM-UH":"Chemistry",
    "CHINL-UH":"Chinese Language",
    "CS-UH":"Computer Sciecne",
    "CCOL-UH":"Core: Colloquium",
    "CADT-UH":"Core: Arts, Design and Tech",
    "CDAD-UH":"Core: Data and Discovery",
    "CCEA-UH":"Core: Cultural Exploration",
    "CSTS-UH":"Core: Structure of thought",
    "ECON-UH":"Economics",
    "ENGR-UH":"Engineering",
    "ENGR-GH":"Engineering(graduate)",
    "FRENL-UH":"French language",
    "HIST-UH":"History",
    "HISTN-UH":"History-AEP/ESP",
    "FILMM-UH":"Film and New Media",
    "LAW-UH":"Legal Studies",
    "MATH-UH":"Mathematics",
    "IM-UH":"Interactive media",
    "MUSIC-UH":"Music",
    "LITCW-UH":"Literature and creative writing",
    "PHIL-UH":"Philosophy",
    "MCC-UH":"Media, Culture and Communication",
    "PHYS-UH":"Physics",
    "PEACE-UH":"Peace studies",
    "PSYCH-UH":"Psychology",
    "PHYED-UH":"Physical Education",
    "SRPP-UH":"Social Research and public policy",
    "POLSC-UH":"Political Science",
    "AW-UH":"The ancient World",
    "SCIEN-UH":"Science",
    "UNIST-UH":"University Studies",
    "SOCSC-UH":"Social sciences",
    "THEAT-UH":"Theater",
    "WRIT-UH":"Writing",
    "VISAR-UH":"Visual Arts"
]
var allTraits = [
"p1":["Amazing professor!!", "100000% recommend", "JUST THE BEST"],
"p2":["knows the material", "learned ALOT", "Very keen"],
"p3" : ["Easy A","lenient grader", " Guaranteed A"],
"p4" : ["Chill course", "Light workload", "Laid back "],

"n1" : ["BORING", "Material not intreseting", "Boring"],
"n2" : ["Heavy work ","Heavy load","A lot of work!"],
"n3" : ["Fair Grader","Fair Grader","Fair Grader"],
"n4" : ["Strict Attendance","Strict Attendance","Strict Attendance"],


"b1" : ["Strict grader","NOT AN EASY A","Harsh grader"],
"b2" : ["Doesnt know  stuff","Seems lost","Not qualified"],
"b3" : ["HORRIBLE PROFESSOR","Doesnt care at all","AWFUL PROFESSOR"],
"b4" : ["AVOID AT ALL COSTS","AVOID AT ALL COSTS","AVOID AT ALL COSTS"],
]


let purpleColor = UIColor(colorLiteralRed: 106/255, green: 31/255, blue: 158/255, alpha: 1)
let orangeColor = UIColor(colorLiteralRed: 247/255, green: 167/255, blue: 0/255, alpha: 1)
let greenColor = UIColor(colorLiteralRed: 68/255, green: 122/255, blue: 0/255, alpha: 1)
let redColor = UIColor(colorLiteralRed: 210/255, green: 0/255, blue: 13/255, alpha: 1)


var traitsByBtnNum = [

    "1":"p1",
    "2":"p2",
    "3":"p3",
    "4":"p4",
    
    "5":"n1",
    "6":"n2",
    "7":"n3",
    "8":"n4",
    
    "9":"b1",
    "10":"b2",
    "11":"b3",
    "12":"b4",

]
