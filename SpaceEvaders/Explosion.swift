import SpriteKit

class Explosion: Sprite {
    required init(x: CGFloat, y: CGFloat) {
        super.init(named: "shockwave", x: x, y: y)
    }

    func boom(main: GameScene, x:Bool=true) {
        if x {
            let explode = SKEmitterNode(fileNamed: "Explode.sks")
            self.addChild(explode!)
        }
        self.runAction(
        SKAction.sequence([
                SKAction.scaleBy(7, duration: 0.5),
                SKAction.runBlock({ main.removeAliens = x }),
                SKAction.fadeAlphaBy(-0.9, duration: 0.6),
                SKAction.removeFromParent()
        ])
        )
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
