//
//  Singletons.swift
//  Singletons
//
//  Created by Jerry on 6/1/21.
//

import Foundation
import UIKit

// singleton *lower case singlton* which means that it's still shared per application run, but you can still create your own instance


//Main Module

extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) {}
}

extension ApiClient {
    func loadFeed(completion: ([FeedItem]) -> Void) {}
}


// API Module
class ApiClient {

    // In swift, you can use this call to perform the same above declaration fo the singleton
    // "static let" is constant and lazy loaded
    static let shared = ApiClient()
        
    func execute(_ : URLRequest, completion: (Data) -> Void) {}

}


class MockApiClient: ApiClient {}

// Login Module
struct LoggedInUser {}


class LoginViewController: UIViewController{
    // dependency injection for to allow for mociking of the api client instance when unit testing
    var login: (((LoggedInUser) -> Void) -> Void)?

    func didTapButton() {
        login? { user in
            // show feed screen
        }
    }
}


// Feed Module
struct FeedItem {}


class FeedViewController: UIViewController {
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFeed? { loadedItems in
            // update UI
        }
    }
}
