//
//  ViewController.swift
//  Rate_App_Complete
//
//  Created by Mr. Naveen Kumar on 18/04/21.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    let appID: String = "959379869" // app_ID
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.rateApp(appID: self.appID)
//            self.ReviewAppController()
        }
    }

}

extension ViewController {
    func rateApp(appID: String) {
        if #available(iOS 14.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        } else {
            SKStoreReviewController.requestReview()
        }
        
        /*
          // This code is for ratting when custom button tapped...
        if let url = URL(string: "https:itunes.apple.com/app/id\(appID)?action=write-review"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
      */
       
    }
    
    
    func ReviewAppController() {
        let alert = UIAlertController(title: "Feedback", message: "Are you enjoying our App?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismis", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes, i Love it!", style: .default, handler: {_ in
            self.rateApp(appID: self.appID)
        }))
        alert.addAction(UIAlertAction(title: "No, this sucks!", style: .default, handler: {_ in
            //Collect feedback
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
