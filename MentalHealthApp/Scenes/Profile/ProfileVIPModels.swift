//
//  ProfileVIPModels.swift
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

enum ProfileVIP {
    // MARK: - Use cases
  
    enum GetUserInfo {
      struct Request { }
      struct Response {
          let user: User?
      }
      struct ViewModel {
          let fullname: String
          let likedQuotes: [String]
      }
  }
}