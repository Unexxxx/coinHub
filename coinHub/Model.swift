import Moya

struct Coin: Decodable {
    let id: String
    let symbol: String
    let name: String
}


enum CoinGeckoService {
    case coinsList
}

extension CoinGeckoService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.coingecko.com/api/v3/")!
    }
    
    var path: String {
        switch self {
        case .coinsList:
            return "coins/list"
        }
    }
    
    var method: Method {
        switch self {
        case .coinsList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}

