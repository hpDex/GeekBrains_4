//
//  GetFriendsListPromise.swift
//  Client VK
//
//  Created by Denis Filippov on 11.04.2022.
//  Copyright © 2022 Vasily Petuhov. All rights reserved.
//

import Foundation
import PromiseKit

class GetFriendsListPromise {
    
    func getData() {
        firstly {
            loadJsonData()
        }.then { data in
            self.parseJsonData(data)
        }.done { friendList in
            self.saveDataToRealm(friendList)
        }.catch { error in
            print(error)
        }
    }
    
    func loadJsonData() -> Promise<Data> {
        return Promise<Data> { (resolver) in
            let configuration = URLSessionConfiguration.default
            let session =  URLSession(configuration: configuration)
            var urlConstructor = URLComponents()
            urlConstructor.scheme = "https"
            urlConstructor.host = "api.vk.com"
            urlConstructor.path = "/method/friends.get"
            urlConstructor.queryItems = [
                URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
                URLQueryItem(name: "fields", value: "photo_50"),
                URLQueryItem(name: "access_token", value: Session.instance.token),
                URLQueryItem(name: "v", value: "5.131")
            ]
            
            session.dataTask(with: urlConstructor.url!) { (data, _, error) in
                if let error = error {
                    return resolver.reject(error)
                } else {
                    return resolver.fulfill(data ?? Data())
                }
            }.resume()
        }
    }
    
    
    func parseJsonData(_ data: Data) -> Promise<[Friend]> {
        return Promise<[Friend]> { (resolver) in
            do {
                let arrayFriends = try JSONDecoder().decode(FriendsResponse.self, from: data)
                var friendList: [Friend] = []
                for index in 0...arrayFriends.response.items.count-1 {
                    if arrayFriends.response.items[index].deactivated == nil {
                        let name = ((arrayFriends.response.items[index].firstName) + " " + (arrayFriends.response.items[index].lastName))
                        let avatar = arrayFriends.response.items[index].avatar
                        let id = String(arrayFriends.response.items[index].id)
                        friendList.append(Friend.init(userName: name, userAvatar: avatar, ownerID: id))
                    }
                }
                resolver.fulfill(friendList)
            } catch let error {
                resolver.reject(error)
            }
        }
    }
    
    func saveDataToRealm(_ friendList: [Friend]) {
            RealmOperations().saveFriendsToRealm(friendList)
    }
    
}
