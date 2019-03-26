//
//  ViewController.swift
//  app-acclerometer-demo
//
//  Created by Aman Meena on 26/03/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit
// step 1
import CoreMotion

class ViewController: UIViewController {

    // MARK: Outlets
    /************************************************************************/
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    // MARK: Propeties
    /************************************************************************/
    // step 2
    var motionManager: CMMotionManager!
    
    /************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // step 3
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    // step 4
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else { return }

        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
//        print(x, y, z)
        
        xLabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"
    }


}

