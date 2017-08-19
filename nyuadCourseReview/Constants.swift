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
    "CS-UH":"Computer Science",
    "CCOL-UH":"Core: Colloquium",
    "CADT-UH":"Core: Arts, Design and Tech",
    "CDAD-UH":"Core: Data and Discovery",
    "CCEA-UH":"Core: Cultural Exploration",
    "CSTS-UH":"Core: Structure of thought",
    "ECON-UH":"Economics",
    "ENGR-UH":"Engineering",
    "ENGR-GH":"Engineering(Graduate)",
    "FRENL-UH":"French Language",
    "HIST-UH":"History",
    "HISTN-UH":"History-AEP/ESP",
    "FILMM-UH":"Film and New Media",
    "LAW-UH":"Legal Studies",
    "MATH-UH":"Mathematics",
    "IM-UH":"Interactive Media",
    "MUSIC-UH":"Music",
    "LITCW-UH":"Literature & Creative Writing",
    "PHIL-UH":"Philosophy",
    "MCC-UH":"Media, Culture and Communication",
    "PHYS-UH":"Physics",
    "PEACE-UH":"Peace studies",
    "PSYCH-UH":"Psychology",
    "PHYED-UH":"Physical Education",
    "SRPP-UH":"SRPP",
    "POLSC-UH":"Political Science",
    "AW-UH":"The ancient World",
    "SCIEN-UH":"Science",
    "UNIST-UH":"University Studies",
    "SOCSC-UH":"Social sciences",
    "THEAT-UH":"Theater",
    "WRIT-UH":"Writing",
    "VISAR-UH":"Visual Arts"
]


var majorsReversed:[String: String] = [
    "Anthropology":"ANTH-UH",
    "Arab Crossroads":"ACS-UH",
    "Arabic language":"ARABL-UH",
    "Biology":"BIOL-UH",
    "Business & Organization":"BUSOR-UH",
    "Chemistry":"CHEM-UH",
    "Chinese Language":"CHINL-UH",
    "Computer Sciecne":"CS-UH",
    "Core: Colloquium":"CCOL-UH",
    "Core: Arts, Design and Tech":"CADT-UH",
    "Core: Data and Discovery":"CDAD-UH",
    "Core: Cultural Exploration":"CCEA-UH",
    "Core: Structure of thought":"CSTS-UH",
    "Economics":"ECON-UH",
    "Engineering":"ENGR-UH",
    "Engineering(graduate)":"ENGR-GH",
    "French language":"FRENL-UH",
    "History":"HIST-UH",
    "History-AEP/ESP":"HISTN-UH",
    "Film and New Media":"FILMM-UH",
    "Legal Studies":"LAW-UH",
    "Mathematics":"MATH-UH",
    "Interactive media":"IM-UH",
    "Music":"MUSIC-UH",
    "Literature and creative writing":"LITCW-UH",
    "Philosophy":"PHIL-UH",
    "Media, Culture and Communication":"MCC-UH",
    "Physics":"PHYS-UH",
    "Peace studies":"PEACE-UH",
    "Psychology":"PSYCH-UH",
    "Physical Education":"PHYED-UH",
    "Social Research and public policy":"SRPP-UH",
    "Political Science":"POLSC-UH",
    "The ancient World":"AW-UH",
    "Science":"SCIEN-UH",
    "University Studies":"UNIST-UH",
    "Social sciences":"SOCSC-UH",
    "Theater":"THEAT-UH",
    "Writing":"WRIT-UH",
    "Visual Arts":"VISAR-UH"
]




var allTraits = [
"p1":["Amazing professor!!", "100000% recommend", "JUST THE BEST"],
"p2":["Knows the material", "Learned ALOT", "Very keen"],
"p3" : ["Easy A","Lenient grader", " Guaranteed A"],
"p4" : ["Chill course", "Light workload", "Laid back "],

"n1" : ["BORING", "Material not intreseting", "Boring"],
"n2" : ["Heavy work ","Heavy load","A lot of work!"],
"n3" : ["Fair Grader","Fair Grader","Fair Grader"],
"n4" : ["Strict Attendance","Strict Attendance","Strict Attendance"],


"b1" : ["Strict grader","NOT AN EASY A","Harsh grader"],
"b2" : ["Don't learn Anything","Useless class","LEARNED NOTHING"],
"b3" : ["HORRIBLE PROFESSOR","Doesnt care at all","AWFUL PROFESSOR"],
"b4" : ["AVOID AT ALL COSTS","AVOID AT ALL COSTS","AVOID AT ALL COSTS"],
]

var traitBtnLbls = [
    "p1":"Best Class Ever",
    "p2":"Material Master",
    "p3":"Easy Grader",
    "p4":"Readily Available",
    "n1":"Boring",
    "n2":"Heavy Workload",
    "n3":"Fair Grader",
    "n4":"Strict Attendance",
    "b1":"Harsh Grader",
    "b2":"Learned Nothing",
    "b3":"Horrible Lecturer",
    "b4":"AVOID",
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
