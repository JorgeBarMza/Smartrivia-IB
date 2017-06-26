//
//  MenuViewController.swift
// 
//
//  Created by Jorge Barrios on 7/31/15.
//  Copyright (c) 2015 Jorge Barrios. All rights reserved.
//

import UIKit



class MenuViewController: UIViewController {
    
    @IBOutlet weak var jugarButton: UIButton!
    
    @IBOutlet weak var reglasButton: UIButton!
    
    //función previa a mostrar la vista
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners(jugarButton)
        roundCorners(reglasButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //implementa el cambio de ventanas
    @IBAction func exitSegue(_ sender: UIStoryboardSegue){
    }
    
    func roundCorners(_ buttonName: UIButton){
        buttonName.layer.cornerRadius = 10
    }
}

