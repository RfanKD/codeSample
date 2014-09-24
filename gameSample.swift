 func colorize (Red: Int, Green: Int, Blue: Int, alpha: Double = 1.0) -> UIColor {
        
        //let red = Double((hex & 0xFF0000) >> 16) / 255.0
        
        //println(hex&0xFF0000)
        
       // let green = Double((hex & 0xFF00) >> 8) / 255.0
        //let blue = Double((hex & 0xFF)) / 255.0
        //var color: UIColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        let red = Red / 255
        let green = Green / 255
        let blue = Blue / 255
        
        
        var color: UIColor = UIColor(red:CGFloat(red), green:CGFloat(Green), blue:CGFloat(Blue), alpha: CGFloat(alpha))
        return color
    }
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
 
                if (self.nodeAtPoint(location) == myBeltOne.childNodeWithName("colorButtonOff")){
              //  println("not touching you ")
                
                    let pressureOff:SKAction = SKAction.rotateByAngle(pressureOffAngle*1.5, duration: 0.09)
                    colorNeedle.runAction(pressureOff)
                }

        }
    }
    
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.position = location
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        
       for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
        

            if (self.nodeAtPoint(location) == myBeltOne.childNodeWithName("colorButtonOff")){
            //println("clicked")
                
                let buttonOff: SKAction = SKAction.fadeAlphaTo(0, duration: 0.1)
               // let waitForButtonAction: SKAction = SKAction.waitForDuration(0.1)
                let buttonOn: SKAction = SKAction.fadeAlphaTo(1, duration: 0.004)
                
                //colorButton.runAction(SKAction .sequence([buttonOn,buttonOff]))
                
                if colorChose == 0{
                    // BUTTON OFF
                    
                    isClicked = 0
                    colorButtonOff.runAction(buttonOn)
                    colorButton.removeFromParent()
                }else if colorChose == 1{
                    // BUTTON ON
                    
                    isClicked = 1
                    colorButtonOff.runAction(buttonOff)
                    colorButton.removeFromParent()
                     myBeltOne.addChild(colorButton)
                
                }
                
               let pressureOn:SKAction = SKAction.rotateToAngle(CGFloat(-M_PI-0.15), duration: 0.1)
               colorNeedle.runAction(pressureOn)
                
                /* colorButtonOff.color = colorButton.color
                colorButtonOff.colorBlendFactor = 0.7
                
               if !(didEnterColorMachine){
                    if colorButton.color == SKColor.magentaColor(){
                //box.color = SKColor.blueColor()
                        // self.colorMachine.childNodeWithName("colorButton").color = SKColor.green
                
                
                        colorButton.color = SKColor.cyanColor()
                //shapeButton.color = SKColor.blueColor()
                //colorButton.colorBlendFactor = 0.9;
                    }else if colorButton.color == SKColor.cyanColor(){
                        //box.color = SKColor.redColor()
                // self.colorMachine.childNodeWithName("colorButton").color = SKColor.green
                //box.colorBlendFactor = 0.9;
                
                        colorButton.color = SKColor.yellowColor()
                //shapeButton.color = SKColor.redColor()
                //colorButton.colorBlendFactor = 0.9;
                    }else if colorButton.color == SKColor.yellowColor() {
                //box.color = SKColor.greenColor()
                // self.colorMachine.childNodeWithName("colorButton").color = SKColor.green
               // box.colorBlendFactor = 0.9;
                
                        colorButton.color = SKColor.magentaColor()
                //shapeButton.color = SKColor.greenColor()
                
                    }else {
                //box.color = SKColor.greenColor()
                // self.colorMachine.childNodeWithName("colorButton").color = SKColor.green
               // box.colorBlendFactor = 0.9;
                
                        colorButton.color = SKColor.magentaColor()
                        colorButton.colorBlendFactor = 0.9;
                
                //shapeButton.colorBlendFactor = 0.9;
                    }
               }*/
                }
            }
    }
    
    func didBeginContact(contact : SKPhysicsContact){
        
        
       /* var firstBody : SKPhysicsBody;
        var secondBody : SKPhysicsBody;
        
        println ("found you")
        didEnterColorMachine = true;
        
        if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
        } else {
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        
        if ((firstBody.categoryBitMask & ContactCategory.colorMachine) != 0) {
            println ("found you")
            //didEnterColorMachine = true;
            
        }*/
    }
   
    override func update(currentTime: CFTimeInterval) {
        
       // println(endCatapult.position.x+CGFloat(endCatapult.size.width/2)+myBeltOne.position.x)
        
        
        //
        //
        // This checks if box is at end of the current belt
        //
        //
        
       // checkLevelNumber()
        
        let returnToBeginning: SKAction = SKAction.runBlock({
        
                self.myBeltOne.position = CGPointMake(self.startMachine.position.x-80, self.startMachine.position.y-410)
            
        })
        let waitFor:SKAction = SKAction.waitForDuration(0.5)
        
        let remove: SKAction = SKAction.runBlock({
            
            self.box.removeFromParent()
            
        })
        
        let fireCatapult:SKAction = SKAction.animateWithTextures([
            
            SKTexture(imageNamed: "shovel-f01"),
            SKTexture(imageNamed: "shovel-f02"),
            SKTexture(imageNamed: "shovel-f03"),
            SKTexture(imageNamed: "shovel-f04")
            ], timePerFrame: 0.05)
        
        let endFireCatapult:SKAction = SKAction.animateWithTextures([
            
            SKTexture(imageNamed: "shovel-f04"),
            SKTexture(imageNamed: "shovel-f03"),
            SKTexture(imageNamed: "shovel-f02"),
            SKTexture(imageNamed: "shovel-f01")
            ], timePerFrame: 0.05)
        
        
        let runCatapult:SKAction = SKAction.runBlock({
            self.endCatapult.runAction(SKAction.sequence([fireCatapult,endFireCatapult]))
        })
        
        let createNewBoxP:SKAction = SKAction.runBlock({

                
                self.createNewBox(self.startMachine.position.x, yPos: self.startMachine.position.y, myWorld:self.levelOne, levelNum: 0)
        })
  
        
            // LEVEL ONE
            //
            // This checks if box enters color change machine's location
            //
            //
            
            myBeltOne.position.x -= CGFloat (groundSpeed)
            box.position.x += CGFloat (boxSpeed)
        
            if (box.position.x-box.size.width/2 >= colorMachine.position.x-CGFloat(colorMachine.size.width/2)+myBeltOne.position.x) &&
                (box.position.x <= colorMachine.position.x+CGFloat(colorMachine.size.width/2)+myBeltOne.position.x){
                    didEnterColorMachine = true;
            
                    if colorButtonOff.alpha == 0 {
                        box.color = colorButtonOff.color
               // box.colorBlendFactor = 1
                    }
            }else {
                didEnterColorMachine = false;
            }
        
            if isClicked == 0 {
                colorChose = 1
            }else if isClicked == 1 {
                colorChose = 0
            }
        
        //check endzone conditions
            
            if (box.position.x >= belt.position.x+CGFloat(belt.size.width/2)+myBeltOne.position.x+50) && atEndZone{
           
                

                let testScene = levelTwoScene (fileNamed: "levelTwoScene")
                testScene.scaleMode = .AspectFill
                let testDirection: SKTransitionDirection = SKTransitionDirection.Left
                let testTransition:SKTransition = SKTransition.pushWithDirection(testDirection, duration: 1.5)
                
                
                myBeltOne.runAction(SKAction.sequence([runCatapult,remove,waitFor]), completion: {
                   // self.view.scene.
                    self.view.presentScene(testScene)
                })
                
                //,returnToBeginning,createNewBoxP
               //levelOne.removeFromParent()
                //self.addChild(levelOne)
                //self.addChild(levelOne)
                
               // atLevelNow = 2;
                //isLevel = true
                
                
           
                //self.view.presentScene(testScene, transition: testTransition)
                
                
                
                  // println("wtf")
                  //   self.view.presentScene(testScene)
                
                
                atEndZone = false
            }

         // checks when the scene reaches end of belt
        
        if endTokenNode.position.x >= endCatapult.position.x+CGFloat(endCatapult.size.width/2)+myBeltOne.position.x{
                //println ("stop now")
               groundSpeed = 0
               boxSpeed = 1
        }
        
            
        
    }
