//
//  BenefactoresCell.swift
//  JaliscoSinHambre
//
//  Created by usuario on 10/07/18.
//  Copyright © 2018 Ulab. All rights reserved.
//

import UIKit

var contactoBenefactor = [Contacto]()
var detalleBenefactor = [Benefactor]()

class BenefactoresCell: FeedCell {
    
    override func fetchAgenda() {
        
        if contactoBenefactor.isEmpty {

            activityIndicator.startAnimating()
            
            contactoBenefactor.removeAll()
            
            apiConnector.fetchBenefactores(completionSucces: { (benefactor) in
                DispatchQueue.main.async{
                    
                    detalleBenefactor = benefactor
                    
                    for ben in benefactor {
                        
                        let firstCharecter = ben.razonSocial?.first
                        
                        contactoBenefactor.append(Contacto(inicial: "\(firstCharecter!)", nombreContacto: ben.razonSocial!, direccionContacto: "Correo: \(ben.email!)", beneficiariosContacto: "Registrado: \(ben.fechaRegistro!)", identificador: "Benefactor"))
                    }
                    
                    self.activityIndicator.stopAnimating()
                    
                    self.collectionView.reloadData()
                    
                }
            }) {
                DispatchQueue.main.async{
                    print("error benefactores")
                    
                    var errorMsg = ""
                    
                    if apiConnector.errorDescription != nil {
                        print(apiConnector.errorDescription!)
                        
                        let loginController = LoginVC()
                        let navController = UINavigationController(rootViewController: loginController)
                        UIApplication.shared.keyWindow?.rootViewController?.present(navController, animated: true, completion: nil)
                        
                    } else {
                        errorMsg = "Error al cargar datos"
                    }
                    
                    let alert = alertController.alertError(titulo: nil, mensaje: "\(errorMsg)")
                    
                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                    
                    self.activityIndicator.stopAnimating()
                }
            }
            
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactoBenefactor.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ContactoCell
        
        cell.nombreContactoLabel.backgroundColor = .clear
        cell.direccionContactoLabel.backgroundColor = .clear
        cell.beneficiariosContactoLabel.backgroundColor = .clear
        
        cell.contacto = contactoBenefactor[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(contactosBancos[indexPath.item].identificador!)
       
        let detalleBenefactorVC = DetalleBenefactorVC()
        detalleBenefactorVC.detalleBenefactorDict = [detalleBenefactor[indexPath.item]]
        
        let navController = UINavigationController(rootViewController: detalleBenefactorVC)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(navController, animated: true, completion: nil)
        
    }
    
    
}

