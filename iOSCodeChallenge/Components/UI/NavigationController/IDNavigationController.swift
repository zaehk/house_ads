//
//  IDNavigationController.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//

import UIKit

class IDNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        setupStyle()
    }
    
    private func setupStyle(){
        navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: Styles.Colors.idealistaPurple]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = Styles.Colors.idealistaMain
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.tintColor = UIColor.black
        
    }
    
}
