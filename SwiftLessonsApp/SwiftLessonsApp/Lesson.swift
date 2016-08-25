//
//  Lesson.swift
//  SwiftLessonsApp
//
//  Created by Admin on 25.08.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

import UIKit

var lessons: [Lesson] = []

func loadLessons() {
    var returnArray: [Lesson] = []

    let array = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Lessons", ofType: "plist")!)!
    
    for lessonDictionary in array {
        let lesson = Lesson(dictionary: lessonDictionary as! NSDictionary)
        returnArray.append(lesson)
    }
    
    lessons = returnArray
}

class Lesson {
    
    var id: Int
    var name: String
    var description: String
    var video: String
    var videoURL: NSURL? {
        return NSURL(string: "https://www.youtube.com/embed/"+video)
    }
    
    init(dictionary: NSDictionary) {
        self.id = dictionary.objectForKey("id") as! Int
        self.name = dictionary.objectForKey("name") as! String
        self.description = dictionary.objectForKey("description") as! String
        self.video = dictionary.objectForKey("url") as! String
    }

}
