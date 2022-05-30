//
//  Box.swift
//  ARKit Demo
//
//  Created by Nikita Vesna on 30.05.2022.
//

import SceneKit
import ARKit


class Box: SCNNode {
    
    init(atPosition: SCNVector3) {
        super.init()
        
        let boxGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green
        
        boxGeometry.materials = [material]
        
        self.geometry = boxGeometry
        self.position = position
        
        let physicsShape = SCNPhysicsShape(geometry: self.geometry!)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: physicsShape)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
