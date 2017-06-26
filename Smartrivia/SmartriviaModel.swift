
//
//  Created by Jorge Barrios on 7/31/15.
//
//

import Foundation

//Clase cerebro

class SmartriviaModel: NSObject {
    
    //Arreglo con cartas
    let deck = ["2_of_clubs","3_of_spades","4_of_hearts","5_of_diamonds","6_of_clubs","7_of_hearts","8_of_spades","9_of_spades","10_of_diamonds","jack_of_clubs2","queen_of_clubs2","king_of_hearts2","ace_of_spades"]
    
    //función para elegir carta al azar
    func dealOneCard()->String{
        let index: Int = Int(arc4random_uniform(13))
        let card = deck[index]
        return card
    }
    
    //Diccionario con los atributos de cada juego
    let gameByCardDictionary: [String:[String]] = [
        "2_of_clubs": ["México","Benito Juarez", "Benito Juarez","Porfirio Diaz", "Don Quijote"] ,
        "3_of_spades": ["Renacimiento","da vinci","Da Vinci","Rafael","Shakespeare"],
        "4_of_hearts": ["Filosofía", "platon","Platón", "Einstein", "Kant"],
        "5_of_diamonds": ["WW2","winston churchill","Winston Churchill","Hitler","Mousolini"],
        "6_of_clubs": ["WW1","Triple Alliance","Triple Alianza", "Triple Entente", "Triple Armada"],
        "7_of_hearts": ["Música","Beethoven","Beethoven","Mozart", "Bach"],
        "8_of_spades": ["Edad Media","william wallace","William Wallace", "Juana de Arco","Moctezuma"],
        "9_of_spades":["Exploraciones","cristobal colon","Cristobal Colón","Magallanes","El Cano"],
        "10_of_diamonds": ["Prehistoria","stonehenge","Stonehenge", "Zigurats", "Monumento al sol"],
        "jack_of_clubs2": ["Revolución","napoleon","Napoleón Bonaparte", "Napoleón Tercero", "Robespiere"],
        "queen_of_clubs2": ["Egipto","cleopatra","Cleopatra", "Tutankamon", "Ramsés"],
        "king_of_hearts2": ["Tudores","HenryVIII","Enrique octavo", "Enrique séptimo", "Ricardo de York"],
        "ace_of_spades": ["Locos años 20","Flapper","Flappers", "Moonshiners", "Gangsters"]
    ]
    
}

//Extensión de arreglo para revolver valores
extension Array {
    var shuffle: [Element] {
        var elementos = self
        for index in indices {
            let otroIndex = Int(arc4random_uniform(UInt32(elementos.count - index))) + index
            otroIndex != index ? swap(&elementos[index], &elementos[otroIndex]) : ()
        }
        return elementos
    }
}