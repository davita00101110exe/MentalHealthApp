//
//  RegistrationPresenter.swift
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

protocol RegistrationPresentationLogic {
    func presentRegistrationOutcome(response: Registration.RegistrationValidation.Response)
}

final class RegistrationPresenter {
    // MARK: - Clean Components
    
    weak var viewController: RegistrationDisplayLogic?
}

// MARK: - RegistrationPresentationLogic

extension RegistrationPresenter: RegistrationPresentationLogic {
    func presentRegistrationOutcome(response: Registration.RegistrationValidation.Response) {
        let viewModel = Registration.RegistrationValidation.ViewModel(outcome: response.outcome, isError: response.isError)
        viewController?.displayRegistrationOutcome(viewModel: viewModel)
    }
}
