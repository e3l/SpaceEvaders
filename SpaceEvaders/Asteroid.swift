//
//  Asteroid.swift
//  SpaceEvaders
//
//  Created by Jack Chang on 6/23/16.
//  Copyright © 2016 Tristen Miller. All rights reserved.
//

import SpriteKit

class Asteroid: Sprite {
    var startAtTop: Bool!
    var disabled: Bool = false
    let vel: CGFloat = 5
    var dx: CGFloat!
    var dy: CGFloat!
    
    init(x: CGFloat, y: CGFloat, startAtTop: Bool, dx: CGFloat, dy: CGFloat) {
        self.dx = dx
        self.dy = dy
        self.startAtTop = startAtTop
        super.init(named: "asteroid", x: x, y: y)
        self.runAction(SKAction.repeatActionForever(SKAction.rotateByAngle(1, duration: 1)))
    }
    
    
    func move() {
        let height = parent?.scene?.size.height
        if height == nil {
            return
        }
        
        var dx = self.dx
        var dy = self.dy
        let mag = sqrt(dx * dx + dy * dy)
        // Normalize and scale
        dx = dx / mag * vel
        dy = dy / mag * vel
        moveBy(dx, dy: dy)
    }
    
    
    func moveBy(dx: CGFloat, dy: CGFloat) {
        self.position = CGPointMake(self.position.x + dx, self.position.y + dy)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}