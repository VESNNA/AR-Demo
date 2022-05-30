//
//  Plane.swift
//  ARKit Demo
//
//  Created by Nikita Vesna on 30.05.2022.
//

import SceneKit
import ARKit


class Plane: SCNNode {
    
    var anchor: ARPlaneAnchor!
    var planeGeometry: SCNPlane!
    
    init(anchor: ARPlaneAnchor) {
        self.anchor = anchor
        super.init()
        configure()
    }
    
    private func configure() {
        self.planeGeometry = SCNPlane(width: CGFloat(anchor.extent.x),
                                      height: CGFloat(anchor.extent.z))
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "pinkWeb.png")
        
        self.planeGeometry.materials = [material]
        self.geometry = planeGeometry
        self.position = SCNVector3(x: anchor.center.x,
                                   y: 0,
                                   z: anchor.center.z)
        self.transform = SCNMatrix4MakeRotation(Float(-Double.pi / 2), 1.0, 0.0, 0.0)
        
        let physicsShape = SCNPhysicsShape(geometry: self.geometry!)
        self.physicsBody = SCNPhysicsBody(type: .static, shape: physicsShape)
    }
    
    func update(anchor: ARPlaneAnchor) {
        self.planeGeometry.width = CGFloat(anchor.extent.x)
        self.planeGeometry.height = CGFloat(anchor.extent.z)
        self.position = SCNVector3(x: anchor.center.x,
                                   y: 0,
                                   z: anchor.center.z)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
