    //
    //  ringView.swift

    import UIKit

    /**
     
     ## ringView class ##
     
     This class is responsible for show a red waves progress to user when waitting to accept a request
     
     */

    class ringView:UIView
    {
        /// timer to start draw
        
        var timer:Timer!
        
        /// last tag of drawn circle
        
        var lastTag:Int = 0
        
        override func draw(_ rect: CGRect)
        {
           print("Calling Rect.....")
           // drawRingFittingInsideView()
        }
        internal func drawRingFittingInsideView()->()
        {
            let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
            let desiredLineWidth:CGFloat = 1    // your desired value
            
            let circlePath = UIBezierPath(
                arcCenter: CGPoint(x:halfSize,y:halfSize),
                radius: CGFloat( halfSize - (desiredLineWidth/2) ),
                startAngle: CGFloat(0),
                endAngle:CGFloat(Double.pi * 4),
                clockwise: true)
            
            
          // print("self.tag \(self.tag) width \(self.frame.size.width)")
            
            let shapeLayer = CAShapeLayer()
          
            shapeLayer.path = circlePath.cgPath
            
            
            shapeLayer.fillColor = UIColor.init(red: 255/255.0, green: 0/255.0, blue: 0/255.0, alpha:   255  / 255.0).cgColor
             shapeLayer.strokeColor = UIColor.init(red: 255/255.0, green:0/255.0, blue: 0/255.0, alpha: 1).cgColor
             shapeLayer.lineWidth = desiredLineWidth
            
            layer.addSublayer(shapeLayer)
        }
        
        /**
         
         ## start draw timer ##
         
         */
        
        func start()
        {
           self.timer = Timer.scheduledTimer(timeInterval: 1.2  ,
                                                     target: self,
                                                     selector: #selector(self.doIt),
                                                     userInfo: nil,
                                                     repeats: true)
          
        }
        
        /**
         
         ## actual draw process with red color ##
         
         */
        
        @objc func doIt()
        {
            
            let v = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 5, height:5))
            
            let halfSize:CGFloat = min( 5/2, 5/2)
            let desiredLineWidth:CGFloat = 1    // your desired value
            
            let circlePath = UIBezierPath(
                arcCenter: CGPoint(x:halfSize,y:halfSize),
                radius: CGFloat( halfSize - (desiredLineWidth/2) ),
                startAngle: CGFloat(0),
                endAngle:CGFloat(Double.pi * 4),
                clockwise: true)
           
            let shapeLayer = CAShapeLayer()
            
            shapeLayer.path = circlePath.cgPath
            
            shapeLayer.fillColor = UIColor.init(red: 255/255.0, green: 0/255.0, blue: 0/255.0, alpha:   255  / 255.0).cgColor
            shapeLayer.strokeColor = UIColor.init(red: 255/255.0, green:0/255.0, blue: 0/255.0, alpha: 1).cgColor
            shapeLayer.lineWidth = desiredLineWidth
            
            v.layer.addSublayer(shapeLayer)
            
            
            let newCon1 = NSLayoutConstraint.init(item:v, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.superview, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0)
            
            
            let newCon2 = NSLayoutConstraint.init(item:v, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.superview, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0)
            
            
            let newCon3 = NSLayoutConstraint.init(item:v, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 5.0)
            
            
            
            let newCon4 = NSLayoutConstraint.init(item:v, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 5.0)
            
            
            v.translatesAutoresizingMaskIntoConstraints = false
            
            v.tag = lastTag
            
            lastTag = lastTag+1
            
            self.superview?.addSubview(v)
            
            self.superview?.addConstraints([newCon1,newCon2,newCon3,newCon4])
            
            
            v.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            
            v.isOpaque=false

            
            UIView.animate(withDuration: 10 , delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
                { () -> Void in
                    
                    v.transform = CGAffineTransform(scaleX: 60, y: 60)
                    
                    v.alpha = 0
                    
                    
                    
                    
            }, completion: { (finished: Bool) -> Void in
                
                v.removeFromSuperview() 
              //  print("Removed lastTag \(v.tag)")
                
            });
            
        }
        /**
         
         ## stop timer and remove red views from it's superView ##
         
         */
        
        func stop()
        {
            if(self.timer != nil)
            {
                self.timer.invalidate()
                
                self.timer = nil
            }
            
            for vs in self.subviews
            {
                vs.layer.removeAllAnimations()
                
                vs.removeFromSuperview()
            }
            
             self.removeFromSuperview()
            
        }
        
    }
     
