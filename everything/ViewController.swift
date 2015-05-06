//
//  ViewController.swift
//  everything
//
//  Created by 杨培文 on 15/5/6.
//  Copyright (c) 2015年 杨培文. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBOutlet weak var search: NSTextField!
    
    
    override func controlTextDidChange(obj: NSNotification) {
        var filename=search.stringValue
        println(filename)
        
        let task = NSTask()
        task.launchPath = "/usr/bin/locate"
        task.arguments = [filename]
        
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        
        var filehandle = pipe.fileHandleForReading
        let data = filehandle.readDataOfLength(2048)
        let output: String = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
        //println(output)
        textview.string = output
        
    }
    
    
    
    @IBOutlet var textview: NSTextView!
    
    override func viewDidDisappear() {
//        abort()
    }
    
    

}

