// Code from the singleton lecture from the essential developer course

import UIKit

struct LoggedInUser {}
struct FeedItem {}


// Singleton
// Api Moduel
class ApiClient {

    // In swift, you can use this call to perform the same above declaration fo the singleton
    // "static let" is constant and lazy loaded
    static let instance = ApiClient()
    
    func execute(_ : URLRequest, completion: (Data) -> Void)  {}
//    func login(completion: (LoggedInUser) -> Void) {}
    func loadFeed(completion: ([FeedItem])  -> Void) {}
}

// Login Module
class LoginViewController: UIViewController {
    var api = ApiClient.shared
    
    func didTapLoginButton() {
        api.login() { user in
            // show feed screen
        }
    }
}

// Feed Module
class FeedViewController: UIViewController {
    var api = ApiClient.shared
}


// singleton *lower case singlton* which means that it's still shared per application run, but you can still create your own instance

let client = ApiClient.instance

class LoginViewController: UIViewController {
    func didTapLoginButton() {
        ApiClient.instance.login() { user in
            // show next screen
        }
    }
}
