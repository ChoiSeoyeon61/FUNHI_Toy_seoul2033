//
//  ARViewController.swift
//  Seoul2033
//
//  Created by 최서연 on 2020/09/25.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

import ARKit
import RealityKit

class ARViewController: UIViewController, ARSessionDelegate,ARSCNViewDelegate,ARSKViewDelegate {

    @IBOutlet weak var arLable: UILabel!
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var arButtonLable: UIButton!
    
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
    
        super.viewDidLoad()
        arLable.text = "돌 아래 뭐가 있나 치워보자!"
        arButtonLable.setTitle( "꼭 확인한 후에 돌아가자.", for: .normal)
        
    
        let woodAnchor = try! WoodAR.loadWoods()
        
      
          
          // Add the box anchor to the scene
        arView.scene.anchors.append(woodAnchor)
    
       
    }
    
    @IBAction func arButtonAction(_ sender: Any) {
        arView.session.pause()
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
