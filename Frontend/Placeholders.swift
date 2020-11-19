//
//  Placeholders.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

enum Placeholders {
    static private let imageURL = URL(string: "https://i.imgur.com/0loCM3K.jpg")!
    
    static var comments = Set<Comment>([
        Comment(
            id: UUID(uuidString: "f6d04991-deb7-4e43-8741-b86140774513")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            postID: UUID(uuidString: "61bede89-8de3-42d4-9cc8-351f57ded067")!,
            text: "Wow great post",
            creationDate: .init(timeIntervalSinceNow: -500)
        ),
        Comment(
            id: UUID(uuidString: "7a3af137-50a3-40f5-aeb9-4eceb16f4998")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            postID: UUID(uuidString: "f5cc5eb5-8049-47c6-89f8-2522878c8d21")!,
            text: "This post is great!",
            creationDate: .init(timeIntervalSinceNow: -500)
        ),
        Comment(
            id: UUID(uuidString: "98e2318e-fa6e-457c-99da-ce8a5d9f470e")!,
            authorID: UUID(uuidString: "9c01220d-4acb-4282-b0b7-306fb2b9f9b1")!,
            postID: UUID(uuidString: "a1fd730e-0b87-451a-8163-602050920f42")!,
            text: "WOW!!!",
            creationDate: .init(timeIntervalSinceNow: -500)
        ),
        Comment(
            id: UUID(uuidString: "168fc86d-8bce-41dc-89b6-f21f0434a02e")!,
            authorID: UUID(uuidString: "9c01220d-4acb-4282-b0b7-306fb2b9f9b1")!,
            postID: UUID(uuidString: "ccf509b2-b26a-4f75-bddc-9e7946e33ae1")!,
            text: "Great!",
            creationDate: .init(timeIntervalSinceNow: -500)
        )
    ])
    
    static var aComment: Comment {
        comments.randomElement()!
    }
    
    static var discounts = Set<Discount>([
        Discount(
            id: UUID(),
            storeName: "Greendotdot",
            name: "25% off 5 Grain Rice",
            requiredPoints: 100,
            description: "Get 25% off 5 Grain Rice with 100 points!"
        ),
        Discount(
            id: UUID(),
            storeName: "Greendotdot",
            name: "25% off Cashew and Walnut Mixed Powder",
            requiredPoints: 100,
            description: "Get 25% off Cashew and Walnut Mixed Powder with 100 points!"
        ),
        Discount(
            id: UUID(),
            storeName: "Greendotdot",
            name: "15% off Wild Honey",
            requiredPoints: 200,
            description: "Get 15% off Wild Honey with 200 points!"
        ),
        Discount(
            id: UUID(),
            storeName: "Greendotdot",
            name: "Buy 1 Get 1 Free Coupon",
            requiredPoints: 1000,
            description: "Buy 1 Get 1 Free anything for 1000 points!"
        ),
        Discount(
            id: UUID(),
            storeName: "John Masters Organics",
            name: "50% off Rosemary Shampoo",
            requiredPoints: 250,
            description: "Get 50% off Shampoo For Fine Hair With Rosemary And Peppermint with 250 points!"
        ),
        Discount(
            id: UUID(),
            storeName: "John Masters Organics",
            name: "25% off Raspberry Hand Cream",
            requiredPoints: 150,
            description: "Get 25% off Raspberry Hand Cream with 150 points!"
        ),
        Discount(
            id: UUID(),
            storeName: "John Masters Organics",
            name: "10% off Lemongrass Body Lotion",
            requiredPoints: 100,
            description: "Get 10% off Fresh Lemongrass Body Lotion for 100 points!"
        ),
        Discount(
            id: UUID(),
            storeName: "John Masters Organics",
            name: "Free Cucumber and Lime Face Wash",
            requiredPoints: 250,
            description: "Get one free 100 ml Organic Cucumber and Lime Face Wash for 250 points"
        )
    ])
    
    static var aDiscount: Discount {
        discounts.randomElement()!
    }
    
    static var posts = Set<Post>([
        Post(
            id: UUID(uuidString: "61bede89-8de3-42d4-9cc8-351f57ded067")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            description: "A cool tree I saw in the park!",
            url: URL(string: "https://i.imgur.com/O7rGk72.jpg")!,
            comments: [
                UUID(uuidString: "f6d04991-deb7-4e43-8741-b86140774513")!
            ]
        ),
        Post(
            id: UUID(uuidString: "f5cc5eb5-8049-47c6-89f8-2522878c8d21")!,
            authorID: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            description: "My favourite picture from when I saw Rhinos on the safari! They are critically endangered, help raise awareness!",
            url: URL(string: "https://i.imgur.com/2Ajto84.jpg")!,
            comments: [
                UUID(uuidString: "7a3af137-50a3-40f5-aeb9-4eceb16f4998")!
            ]
        ),
        Post(
            id: UUID(uuidString: "a1fd730e-0b87-451a-8163-602050920f42")!,
            authorID: UUID(uuidString: "9c01220d-4acb-4282-b0b7-306fb2b9f9b1")!,
            description: "Save the trees! This beautiful environment is ours to protect!",
            url: URL(string: "https://i.imgur.com/EvyTu8g.jpg")!,
            comments: [
                UUID(uuidString: "98e2318e-fa6e-457c-99da-ce8a5d9f470e")!
            ]
        ),
        Post(
            id: UUID(uuidString: "ccf509b2-b26a-4f75-bddc-9e7946e33ae1")!,
            authorID: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            description: "Amazing! Spend a day cleaning up the park!",
            url: URL(string: "https://i.imgur.com/h01eqLK.jpg")!,
            comments: [
                UUID(uuidString: "168fc86d-8bce-41dc-89b6-f21f0434a02e")!
            ]
        ),
        Post( //here onwards need to my changed they are repeats
            id: UUID(uuidString: "")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            description: "A cool tree I saw in the park!",
            url: URL(string: "https://i.imgur.com/O7rGk72.jpg")!,
            comments: [
                UUID(uuidString: "f6d04991-deb7-4e43-8741-b86140774513")!
            ]
        ),
        Post(
            id: UUID(uuidString: "")!,
            authorID: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            description: "My favourite picture from when I saw Rhinos on the safari! They are critically endangered, help raise awareness!",
            url: URL(string: "https://i.imgur.com/2Ajto84.jpg")!,
            comments: [
                UUID(uuidString: "7a3af137-50a3-40f5-aeb9-4eceb16f4998")!
            ]
        ),
        Post(
            id: UUID(uuidString: "")!,
            authorID: UUID(uuidString: "9c01220d-4acb-4282-b0b7-306fb2b9f9b1")!,
            description: "Save the trees! This beautiful environment is ours to protect!",
            url: URL(string: "https://i.imgur.com/EvyTu8g.jpg")!,
            comments: [
                UUID(uuidString: "98e2318e-fa6e-457c-99da-ce8a5d9f470e")!
            ]
        ),
    ])
    
    static var aPost: Post {
        posts.randomElement()!
    }
    
    static var users = Set<User>([
        User(
            id: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            username: "leafuwu",
            name: "Rachel",
            bio: "I love trees!",
            profilePictureURL: imageURL,
            posts: [
                UUID(uuidString: "61bede89-8de3-42d4-9cc8-351f57ded067")!
            ]
        ),
        User(
            id: UUID(uuidString: "9c01220d-4acb-4282-b0b7-306fb2b9f9b1")!,
            username: "grassguy",
            name: "Gerald Smithers",
            bio: "Hope you guys like my account!",
            profilePictureURL: URL(string: "https://i.imgur.com/N4jhbXl.jpg")!,
            posts: [
                UUID(uuidString: "a1fd730e-0b87-451a-8163-602050920f42")!,
            ]
        ),
        User(
            id: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            username: "treebu",
            name: "Nick",
            bio: "I post photos!",
            profilePictureURL: URL(string: "https://i.imgur.com/hLtIC3a.jpg")!,
            posts: [
                UUID(uuidString: "f5cc5eb5-8049-47c6-89f8-2522878c8d21")!,
                UUID(uuidString: "ccf509b2-b26a-4f75-bddc-9e7946e33ae1")!
            ]
        ),
        User(
            id: UUID(uuidString: "e2c61608-1d45-4eff-a052-23d688e30c8b")!,
            username: "croissantdream",
            name: "Loren",
            bio: "I'm loving Canopy!!",
            profilePictureURL: imageURL,
            posts: [
               
            ]
        ),
        User(
            id: UUID(uuidString: "8caff95c-1112-4e85-914f-a9b94d3d267b")!,
            username: "eggbro",
            name: "Brody",
            bio: "This app is so cool",
            profilePictureURL: imageURL,
            posts: [
               
            ]
        )
    ])
    
    static var aUser: User {
        users.randomElement()!
    }
    
    static var userPoints = Set<UserPoints>([
        UserPoints(id: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!, points: 100),
        UserPoints(id: UUID(uuidString: "9c01220d-4acb-4282-b0b7-306fb2b9f9b1")!, points: 1000),
        UserPoints(id: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!, points: 500)
    ])
    
    static var aUserPoints: UserPoints {
        userPoints.randomElement()!
    }
}
