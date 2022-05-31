//
//  VirtualObject.swift
//  ARKit Demo
//
//  Created by Nikita Vesna on 31.05.2022.
//

import SceneKit

class VirtualObject: SCNReferenceNode {
    
    static let availableObjects: [SCNReferenceNode] = {
        guard let modelsURLs = Bundle.main.url(forResource: "art.scnassets",
                                               withExtension: nil) else { return [] }
        let fileEnumerator = FileManager().enumerator(at: modelsURLs,
                                                      includingPropertiesForKeys: nil)!
        return fileEnumerator.flatMap { element in
            
            let url = element as! URL
            guard url.pathExtension == "scn" else { return nil }
            
            return VirtualObject(url: url)
        }
    }()
}
