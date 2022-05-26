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
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        let scene = SCNScene()
        createBox(in: scene)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(boxTapped))
        self.sceneView.addGestureRecognizer(gestureRecognizer)
        
        sceneView.scene = scene
    }
    
    @objc func boxTapped(touch: UITapGestureRecognizer) {
        let sceneView = touch.view as! SCNView
        let touchLocation = touch.location(in: sceneView)
        
        let touchResults = sceneView.hitTest(touchLocation, options: [:])
        guard !touchResults.isEmpty, let node = touchResults.first?.node else { return }
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIColor.blue
        boxMaterial.specular.contents = UIColor.red
        node.geometry?.materials[0] = boxMaterial
    }
    
    private func createBox(in scene: SCNScene) {
        sceneView.autoenablesDefaultLighting = true
        
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let node = SCNNode(geometry: box)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        material.specular.contents = UIColor.yellow
        
        node.geometry?.materials = [material]
        
        node.position = SCNVector3(0.0, 0.0, -1.0)
        
        scene.rootNode.addChildNode(node)
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
