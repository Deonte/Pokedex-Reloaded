//
//  SceneDelegate.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }
    
    
    func createPokemonNC() -> UINavigationController {
        let pokemonController = PokemonController()
        pokemonController.title = "Pokemon"
        pokemonController.tabBarItem = UITabBarItem(title: "Pokemon", image: #imageLiteral(resourceName: "pokemon-tabBar-active"), tag: 0)
        
        return UINavigationController(rootViewController: pokemonController)
    }
    
    
    func createMovesController() -> UINavigationController {
        let movesController = MovesController()
        movesController.title = "Moves"
        movesController.tabBarItem = UITabBarItem(title: "Moves", image: #imageLiteral(resourceName: "moves-tabBar-active"), tag: 1)
        
        return UINavigationController(rootViewController: movesController)
    }
    
    
    func createItemsNC() -> UINavigationController {
        let itemsController = ItemsController()
        itemsController.title = "Items"
        itemsController.tabBarItem = UITabBarItem(title: "Items", image: #imageLiteral(resourceName: "items-tabBar-active"), tag: 2)
        
        return UINavigationController(rootViewController: itemsController)
    }
    
    
    func createTabbar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .label
        tabBar.viewControllers = [createPokemonNC(), createMovesController(), createItemsNC()]
        
        return tabBar
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

