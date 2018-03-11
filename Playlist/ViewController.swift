//
//  ViewController.swift
//  Playlist
//
//  Created by yulz on 3/11/18.
//  Copyright © 2018 yulz. All rights reserved.
//

import UIKit
import SpotifyLogin

class ViewController: UIViewController {
    
    var overlayView :UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Notify if login is succesful after luanching login flow
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccessful), name: .SpotifyLoginSuccessful, object: nil)
        
        SpotifyLogin.shared.getAccessToken { (accessToken, error) in
            if error != nil {
                // Hide current view if not logged in
                self.overlayView = UIView(frame: self.view.frame)
                self.overlayView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
                self.view.addSubview(self.overlayView)
                
                // User is not logged in, create login button
                let button = SpotifyLoginButton(viewController: self, scopes: [.streaming, .userLibraryRead])
                
                // Let's center the button on the view
                var frame = button.frame
                frame.origin.x = (self.view.frame.size.width / 2) - (frame.size.width / 2)
                frame.origin.y = (self.view.frame.size.height / 2) - (frame.size.height / 2)
                button.frame = frame
                self.overlayView.addSubview(button)
                
                // Add the view
                UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
                    self.view.addSubview(self.overlayView)
                })
            }
        }
        print(SpotifyLogin.shared.username ?? "nil username")
    }
    
    @objc func loginSuccessful() {
        print("success")
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
            self.overlayView.removeFromSuperview()
            print(SpotifyLogin.shared.username ?? "nil username")
        })
    }

}

