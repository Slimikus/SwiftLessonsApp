//
//  LessonsListCell.swift
//  SwiftLessonsApp
//
//  Created by Admin on 25.08.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

import UIKit

class LessonsListCell: UITableViewCell {
    
    var lesson: Lesson?
    
    @IBOutlet weak var imageLesson: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPart: UILabel!
    
    func initCell(lesson: Lesson) {
        labelName.text = lesson.description
        labelPart.text = "Урок " + String(lesson.id)
        imageLesson.image = UIImage(named: "swift.png")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
