//
//  AppDelegate.swift
//  ExamMaster
//
//  Created by aleksey on 27.02.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit
import ModelsTreeKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    SessionController.controller.configuration = SessionControllerConfiguration.appConfiguration()
    SessionController.controller.representationRouter = AppRootRepresentationRouter()
    SessionController.controller.sessionRouter = AppSessionRouter()
    SessionController.controller.modelRouter = AppRootModelRouter()
    SessionController.controller.serviceConfigurator = AppServiceConfigurator()
    SessionController.controller.navigationManager = AppNavigationManager(window: window)
    
    SessionController.controller.restoreLastOpenedOrStartAnonymousSession()
    
    return true
  }

}

