//
//  AppCredentials.swift
//  ExamMaster
//
//  Created by aleksey on 28.02.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation
import ModelsTreeKit

enum AppCredentialsKeys: String, CredentialsKey {
  case Token = "token"
  case Uid = "uid"
  case Username = "username"
}


extension SessionCredentials {
  var uid: String! {
    return self[AppCredentialsKeys.Uid] as! String
  }
  
  var token: String! {
    return self[AppCredentialsKeys.Token] as! String
  }
  
  var username: String! {
    return self[AppCredentialsKeys.Username] as! String
  }
}