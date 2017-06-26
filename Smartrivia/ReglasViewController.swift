//
//  ReglasViewController.swift
//  
//
//  Created by Jorge Barrios on 8/7/15.
//
//

import UIKit

//Clase de Vista de Reglas

class ReglasViewController: UIViewController {
    
    //declarando variables de vista
    
    @IBOutlet weak var BigLabel: UILabel!
    
    @IBOutlet weak var menuButton: UIButton!
    
    var bigText =  "El objetivo del juego es contestar todas las preguntas correctas. Cada carta representa una categoría: \n \n \t\t\t\t 2. Historia \n \t\t\t\t 3. Renacimiento \n \t\t\t\t 4. Filosofía \n \t\t\t\t 5. WW2 \n \t\t\t\t 6. WW2 \n \t\t\t\t 7. Música \n \t\t\t\t 8. Edad Media \n \t\t\t\t 9. Exploraciones \n \t\t\t\t10. Prehistoria \n \t\t\t\t J. Revolución Francesa \n \t\t\t\t Q. Egipto \n \t\t\t\t K. Tudores \n \t\t\t\t A. Locos años 20 \n \nAl responder 10 preguntas se obtiene un resultado y los jugadores con más de 8 puntos reciben premio por su maestra!"
    
    //funcion para antes de mostrar la ventana
    override func viewDidLoad() {
        super.viewDidLoad()
        
       BigLabel.text = bigText
        roundCorners(menuButton)
       
    }
    
    //función automática
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func roundCorners(_ buttonName: UIButton){
        buttonName.layer.cornerRadius = 10
    }

}
