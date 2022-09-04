//
//  RegistrationVIPRouter.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 03.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RegistrationVIPRoutingLogic {
    func routeToLoginVC()
}

class RegistrationVIPRouter: RegistrationVIPRoutingLogic {
    // MARK: - Clean Components

    weak var viewController: RegistrationVIPViewController?
    
    // MARK: - Routing
    
    func routeToLoginVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "LoginVIPViewController") as! LoginVIPViewController
        navigateToLoginVC(source: viewController!, destination: destinationVC)
        
    }
    
    // MARK: - Navigation
    
    func navigateToLoginVC(source: RegistrationVIPViewController, destination: LoginVIPViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            source.navigationController?.popToRootViewController(animated: true)
        }
    }

}