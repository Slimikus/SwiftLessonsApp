//
//  LessonController.swift
//  SwiftLessonsApp
//
//  Created by Admin on 25.08.16.
//  Copyright © 2016 Slimikus. All rights reserved.
//

import UIKit

class LessonController: UITableViewController {
    
    var lesson: Lesson?
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBAction func pushButtonLike(sender: AnyObject) {
    }
    @IBOutlet weak var buttonDislike: UIButton!
    @IBAction func pushButtonDislike(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = lesson?.description
        navigationItem.title = lesson?.name
        webView.alpha = 0
        webView.loadRequest(NSURLRequest(URL: (lesson?.videoURL)!))
        webView.delegate = self
     
    }
}

extension LessonController: UIWebViewDelegate {
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
       // print(request.URL?.absoluteString)
        if request.URL == lesson?.videoURL {
            return true
        }
        if request.URL?.absoluteString == "about:blank" {
            return true
        }
        webView.reload()
        
        return false
    }
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
        webView.alpha = 1
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("Error when loading url \(lesson?.videoURL?.absoluteString)")
        print(error?.localizedDescription)
    }
}