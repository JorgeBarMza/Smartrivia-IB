//
//  FinalViewController.swift
//  Smartrivia
//
//  Created by Jorge on 3/3/16.
//  Copyright © 2016 Jorge Barrios. All rights reserved.
//

import UIKit

//Clase de pantalla final

class FinalViewController: UIViewController{
    
    //Variables de vista
    
    @IBOutlet weak var puntuaciónLabel: UILabel!
    
    
    @IBOutlet weak var premioLabel: UILabel!
    
    //Variables con valores
    
    var puntuación: Double = 0
    var preguntasTotales: Double = 0
    var resultado: Double = 0.0
    

    //función para presentar la ventana
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultado = (puntuación/preguntasTotales) * 100
        puntuaciónLabel.text = String(resultado)
        
        if(resultado>80){
            premioLabel.text = "¡Felicidades! Canjea tu premio con tu Maestra"
        }else{
            premioLabel.text = "Buen esfuerzo, vuelve a intentar"
        }
    }
}

