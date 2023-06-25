import Foundation

class ServerAPI {

    class func vote(option: String, completion: @escaping (Bool, String?, Error?) -> Void) {
        let urlString = option == "yes" ? "http://10.2.0.148:3000/yes" : "http://10.2.0.148:3000/no"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(false, nil, error)
            } else if let data = data {
                // Assume server response is a dictionary with {"transactionHash": "your_transaction_hash"}
                let responseDict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
                let transactionHash = responseDict?["transactionHash"]
                completion(true, transactionHash, nil)
            } else {
                completion(false, nil, nil)
            }
        }
        task.resume()
    }

    class func fetchPost(completion: @escaping (Bool, String?, Error?) -> Void) {
        let urlString = "http://10.2.0.148:3000/hash"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(false, nil, error)
            } else if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                completion(true, responseString, nil)
            } else {
                completion(false, nil, nil)
            }
        }
        task.resume()
    }
}
