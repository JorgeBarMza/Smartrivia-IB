//
//  GameViewController.swift
//  Smartrivia
//
//  Created by Jorge Barrios on 7/31/15.
//  Copyright (c) 2015 Jorge Barrios. All rights reserved.
//

import UIKit

//Clase de Vista de juego
class GameViewController: UIViewController {
    
    // Declarando variables de vista
    
    @IBOutlet weak var menuButton: UIButton!
   
    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var dealButton: UIButton!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var front: UIImageView!
    
    @IBOutlet weak var blurVisualEffectView: UIVisualEffectView!
    
    
    @IBOutlet weak var onTopOfVisualEffectView: UIView!
    
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    @IBOutlet weak var historyImage: UIImageView!
    
    @IBOutlet weak var respuesta1: UIButton!
    @IBOutlet weak var respuesta2: UIButton!
    @IBOutlet weak var respuesta3: UIButton!
    
    
    let tapRec = UITapGestureRecognizer() //habilitando el tacto
    
    var james = SmartriviaModel() //Instancia de la clase cerebro
    
    //Inicializando variables de operación
    
    var imageName = ""
    var showingCard = false
    var timer: Timer?
    var puntuación: Int = 0
    var respuestaCorrecta: String = ""
    var preguntasTotales: Int = 0
    
    //función que se cumple antes de mostrar la ventana
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundCorners(menuButton, level: 10)
        roundCorners(dealButton, level: 10)
        roundCorners(cardView, level: 40)
        
        back.image = UIImage(named: "Back_Card.png")
        front.image =  UIImage(named: "Back_Card.png")
        
        tapRec.addTarget(self, action: #selector(GameViewController.tapGesture))
    }
    
    //función automática del programa
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //función completa para la carta
    @IBAction func getCard(_ sender: AnyObject) {
        if showingCard{
            getCard()
        }else{
            flipCard()
            getCard()
        }
        //Voltea la carta o la muestra dependiendo de la situación
    }
    
    //funciones para acciones específicas
    func getCard(){
        fadeOutCardView()
        imageName = james.dealOneCard() //método de clase cerebro
        self.front.image = UIImage(named: imageName) //cambia imagen antes de revelarla
        fadeInCardView()
        let gameName = james.gameByCardDictionary[imageName]![0]
        gameLabel.text = gameName
        cardView.addGestureRecognizer(tapRec)
    }
    
    //Animaciones
    func fadeOutCardView(){
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {self.cardView.alpha = 0}, completion: nil)
    }
    
    func fadeInCardView(){
        UIView.animate(withDuration: 0.5, delay: 0 , options: UIViewAnimationOptions.curveEaseIn, animations: {self.cardView.alpha = 1.0}, completion: nil)
    }
    
    func tapGesture(){
        if showingCard{
            flipCard()
            blurVisualEffectView.addGestureRecognizer(tapRec)
        }else{
            exitGameDescription()
            flipCard()
            cardView.addGestureRecognizer(tapRec)
        }
    }
    
    //Acción llamada por botón
    @IBAction func flipCardButton(_ sender: AnyObject) {
        flipCard()
    }
    
    //función para voltear carta
    func flipCard(){
        if showingCard{
        UIView.transition(from: front, to: back, duration: 1, options: [UIViewAnimationOptions.transitionFlipFromLeft, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
        showingCard = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.showGameDescription), userInfo: nil, repeats: false)
    }else{
            UIView.transition(from: back, to: front, duration: 1, options:  [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
            showingCard = true
        }
    }
    
    func roundCorners(_ objectName: AnyObject, level: CGFloat){
        objectName.layer.cornerRadius = level
    }
    
    //función de acceso a las preguntas y respuestas
    func showGameDescription(){
        preguntasTotales += 1 //Contador de preguntas respondidas
        descolorarBotonesRespuesta()
        blurVisualEffectView.isHidden = false
        gameNameLabel.text = gameLabel.text
        gameNameLabel.isHidden = false
        let historyFile = UIImage(named:james.gameByCardDictionary[imageName]![1])
        let respuestasArray = [james.gameByCardDictionary[imageName]![2],james.gameByCardDictionary[imageName]![3],james.gameByCardDictionary[imageName]![4]]
        respuestaCorrecta = respuestasArray[0]
        historyImage.image = historyFile
        organizarRespuestas(respuestasArray)
    }
    
    //función que revuelve y establece respuestas
    func organizarRespuestas(_ respuestas:[String]){
        var respuestas = respuestas
        respuestas=respuestas.shuffle
        let respuesta1Titulo = respuestas[0]
        let respuesta2Titulo = respuestas[1]
        let respuesta3Titulo = respuestas[2]
        
        respuesta1.setTitle(respuesta1Titulo, for: UIControlState())
        respuesta2.setTitle(respuesta2Titulo, for: UIControlState())
        respuesta3.setTitle(respuesta3Titulo, for: UIControlState())
        
    }
    
    //Regresa al color estandar de respuestas
    func descolorarBotonesRespuesta(){
        respuesta1.backgroundColor = UIColor.gray
        respuesta2.backgroundColor = UIColor.gray
        respuesta3.backgroundColor = UIColor.gray
    }
    
    //Evalúa si la respuesta elegida es correcta
    func evaluarRespuesta(_ respuestaTexto: String, botonTocado: UIButton){
        if(respuestaTexto == respuestaCorrecta){
            botonTocado.backgroundColor = UIColor.green
            puntuación += 1
        }else{
            botonTocado.backgroundColor = UIColor.red
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.exitGameDescription), userInfo: nil, repeats: false)
    }
    
    //Acciones de botones respuesta
        
    @IBAction func respuesta1Tocado(_ sender: AnyObject) {
        evaluarRespuesta(respuesta1.title(for: UIControlState())!, botonTocado: respuesta1)
        }
    @IBAction func respuesta2Tocado(_ sender: AnyObject) {
        evaluarRespuesta(respuesta2.title(for: UIControlState())!, botonTocado: respuesta2)
        
        }
    @IBAction func respuesta3Tocado(_ sender: AnyObject) {
        evaluarRespuesta(respuesta3.title(for: UIControlState())!, botonTocado: respuesta3)
        }
    
    //función para salir de pantalla de preguntas
    func exitGameDescription(){
        blurVisualEffectView.isHidden = true
        UIView.transition(from: back, to: front, duration: 1, options:  [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
        showingCard = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.getCard as (GameViewController) -> () -> ()), userInfo: nil, repeats: false)
    }
    
    //función para comunicar instancias de clases
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToFinalViewController"
        {
            if let destinoVC = segue.destination as? FinalViewController{
                destinoVC.puntuación = Double(puntuación)
                destinoVC.preguntasTotales = Double(preguntasTotales)
            }
        }
    }
}

