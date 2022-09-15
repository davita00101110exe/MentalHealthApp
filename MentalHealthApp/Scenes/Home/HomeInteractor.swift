//
//  HomeInteractor.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 04.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic {
    func getUser(request: Home.GetUser.Request)
    func getQuote(request: Home.GetQuote.Request)
    func updateLikedQuotes(request: Home.UpdateLikedQuotes.Request)
}

final class HomeInteractor {
    // MARK: - Clean Components
    
    var presenter: HomePresentationLogic?
    var worker: HomeWorkerLogic?
}

// MARK: - HomeBusinessLogic

extension HomeInteractor: HomeBusinessLogic {
    func getUser(request: Home.GetUser.Request) {
        UserService.fetchUser(detach: false) { [weak self] user in
            let response = Home.GetUser.Response(user: user)
            self?.presenter?.presentUser(response: response)
        }
    }
    
    func getQuote(request: Home.GetQuote.Request) {        
        Task {
            do {
                let quote = try await worker?.fetchQuote()
                DispatchQueue.main.async { [weak self] in
                    let response = Home.GetQuote.Response(quote: quote)
                    self?.presenter?.presentQuote(response: response)
                }
            }
        }
    }
    
    func updateLikedQuotes(request: Home.UpdateLikedQuotes.Request) {
        guard let quote = request.quote else { return }
        let condition = request.clickedLike
        
        UserService.updateLikedQuotesArray(condition: condition, quote: quote)
    }
}
