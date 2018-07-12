//
//  AlertController.swift
//  JaliscoSinHambre
//
//  Created by usuario on 23/05/18.
//  Copyright © 2018 Ulab. All rights reserved.
//

import UIKit

let alertController = AlertController()

class AlertController {
    
    var mensajeError : String?
    
    //MARK: Alerta error
    func alertError(titulo: String?, mensaje: String) -> UIAlertController {
        
        self.mensajeError = mensaje
        
        print(mensajeError!)
        let alertController = UIAlertController(title: titulo, message: mensajeError, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
            
        }
        
        alertController.addAction(okAction)
        
        return alertController
    }
    
    //MARK: Alerta Aceptar/Cancelar
    func alertAceptarCancelar(mensaje: String, btnAceptar: String, btnCancelar: String) -> UIAlertController {
        
        self.mensajeError = mensaje
        
        print(mensajeError!)
        
        let alertController = UIAlertController(title: nil, message: mensajeError, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("cancel")
            
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }
    
    
}
