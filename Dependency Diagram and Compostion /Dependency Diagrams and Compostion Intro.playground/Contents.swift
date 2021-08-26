import UIKit


protocol FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void)
}

class FeedViewController: UIViewController {
    var loader: FeedLoader!
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFeed { loadedItems in
            // Update UI
        }
    }
    
}


class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something
        
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // do something
        
    }
}


struct Reachability {
    static let networkAvailable = false
}

class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    let remote: RemoteFeedLoader
    let local: LocalFeedLoader
    
    init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        let load = Reachability.networkAvailable ?
            remote.loadFeed : local.loadFeed
        load(completion)
    }
}


let vc = FeedViewController(loader: LocalFeedLoader())
let vc2 = FeedViewController(loader: RemoteFeedLoader())
let vc3 = FeedViewController()
vc3.loader = RemoteWithLocalFallbackFeedLoader(
                                remote: RemoteFeedLoader(),
local: LocalFeedLoader())



var dict = [Int: (Int,Int)]()

dict[4] = (1,2)
for sum in dict.keys {
    if dict.contains(where: <#T##((key: Int, value: (Int, Int))) throws -> Bool#>)
    print(sum)
}

