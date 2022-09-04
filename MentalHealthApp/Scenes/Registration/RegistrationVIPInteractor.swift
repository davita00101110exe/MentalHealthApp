//
//  RegistrationVIPInteractor.swift
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

protocol RegistrationVIPBusinessLogic {
    func validateRegistration(request: RegistrationVIP.RegistrationValidation.Request)
}

class RegistrationVIPInteractor {
    //MARK: - Clean Components
    
    var presenter: RegistrationVIPPresentationLogic?
    var worker: RegistrationVIPWorkerLogic?
}

// MARK: - RegistrationVIPBusinessLogic

extension RegistrationVIPInteractor: RegistrationVIPBusinessLogic {
    
    func validateRegistration(request: RegistrationVIP.RegistrationValidation.Request) {
        guard let firstname = request.firstname?.trimmingCharacters(in: .whitespacesAndNewlines),
              let lastname = request.lastname?.trimmingCharacters(in: .whitespacesAndNewlines),
              let email = request.email?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password = request.password?.trimmingCharacters(in: .whitespacesAndNewlines),
              let confirmPassword = request.confirmPassword?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        
        if firstname == "" ||
            lastname == "" ||
            email == "" ||
            password == "" ||
            confirmPassword == "" {
            
            presenter?.presentRegistrationOutcome(response: RegistrationVIP.RegistrationValidation.Response(outcome: "Please fill in all fields", isError: true))
        }
        
        // Checking if the password is secure
        else if Utilities.isPasswordValid(password) == false {
            presenter?.presentRegistrationOutcome(response: RegistrationVIP.RegistrationValidation.Response(outcome: "Please make sure your password is at least 8 characters, contains a number and an uppercase letter", isError: true))
        }
        
        // Checking if passwords match
        else if password != confirmPassword {
            presenter?.presentRegistrationOutcome(response: RegistrationVIP.RegistrationValidation.Response(outcome: "Please make sure your passwords match", isError: true))
        }
        
        else {
            worker = RegistrationVIPWorker()
            worker?.registerUser(withEmail: email, password: password, firstname: firstname, lastname: lastname) { (outcome, isError) in
                self.presenter?.presentRegistrationOutcome(response: RegistrationVIP.RegistrationValidation.Response(outcome: outcome, isError: isError))
            }
        }
    }
}