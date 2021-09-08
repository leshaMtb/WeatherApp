//
//  AlertController.swift
//  hidekeyboard
//
//  Created by Apple on 22.12.2020.
//

import UIKit

extension ViewController {
    
    func presentSearchAlertController(witchTitle title: String?, message: String?, style: UIAlertController.Style,complitionHandler: @escaping (String)->Void) {
        
        let alertcontroller = UIAlertController( title: title, message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let searchbutton = UIAlertAction(title: "Search", style: .default, handler: nil)
        alertcontroller.addTextField { (textField) in
            textField.placeholder = "Город"
        }
        
        alertcontroller.addAction(cancelButton)
        alertcontroller.addAction(searchbutton)
        
        present(alertcontroller, animated: true, completion: nil)
    }
}

