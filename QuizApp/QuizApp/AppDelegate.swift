//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Abdoulaye Diallo on 7/7/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
//        let viewController = QuestionViewController(question: "A Question?", options: ["Options 1", "Options 2"]){
//            print($0)
//        }
        
        let viewController = ResultsViewController(summary: "You got 1/2 Correct", answers: [
        
            PresentableAnswer(question:"Question??", answer: "Yeah!", wrongAnswer:nil),
            PresentableAnswer(question:"Another Question??", answer: "Hell Yeah!", wrongAnswer:"Hell No!")
        ])
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

