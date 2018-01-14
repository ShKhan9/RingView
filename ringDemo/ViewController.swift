//
//  ViewController.swift
//  ringDemo
 

import UIKit

class ViewController: UIViewController {

        var rView:ringView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        
        
         rView = ringView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
         
         rView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            
         rView.isOpaque=false
            
         self.view.addSubview(rView)
            
        rView.center = self.view.center
        
        }
        
        override func viewDidAppear(_ animated: Bool) {
            
            rView.start()
            
            
        }
    
        override func viewDidDisappear(_ animated: Bool) {
        
            rView.stop()
            
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

