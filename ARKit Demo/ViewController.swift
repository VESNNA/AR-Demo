//
//  ViewController.swift
//  ARKit Demo
//
//  Created by Nikita Vesna on 22.05.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        
        let sphereGeometry = SCNSphere(radius: 0.3)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "earth.jpg")
        
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.geometry?.materials = [sphereMaterial]
        sphereNode.position = SCNVector3(0, 0, -1)
        
        scene.rootNode.addChildNode(sphereNode)
        
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
