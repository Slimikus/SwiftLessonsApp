//
//  ShareManager.swift
//  SwiftLessonsApp
//
//  Created by Admin on 26.08.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

import UIKit
import MessageUI

let __shareManareg = ShareManager()

class ShareManager: NSObject {
    
    
    var mailController = MFMailComposeViewController()
    
    func sendMail(reciepients: [String], subject: String, text: String, vc: UIViewController) {
        
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(reciepients)
        mailController.setSubject(subject)
        mailController.setMessageBody(text, isHTML: false)
        
        vc.presentViewController(mailController, animated: true, completion: nil)
    }
    
    //соц сети будут тут

}

extension ShareManager: MFMailComposeViewControllerDelegate {
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}