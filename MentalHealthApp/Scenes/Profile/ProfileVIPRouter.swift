//
//  ProfileVIPRouter.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 06.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProfileVIPRoutingLogic {
    func routeToBottomSheet()
}

final class ProfileVIPRouter: ProfileVIPRoutingLogic {
    // MARK: - Clean Components
    
    weak var viewController: ProfileVIPViewController?
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    // MARK: - Routing
    
    func routeToBottomSheet() {
        guard let bottomSheetVC = storyboard.instantiateViewController(withIdentifier: "BottomSheetViewController") as? BottomSheetViewController else { return }

        Utilities.setupBottomSheet(sheet: bottomSheetVC, sheetColor: Constant.Color.mainColor, sheetTitle: "Do you really want to sign out?", buttonColor: Constant.Color.redColor, detents: [.medium()])
        
        navigateToBottomSheetVC(source: viewController!, destination: bottomSheetVC)
    }
    
    // MARK: - Navigation
    
    func navigateToBottomSheetVC(source: ProfileVIPViewController, destination: BottomSheetViewController) {
        source.present(destination, animated: true)
    }
}
