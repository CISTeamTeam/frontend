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
            text: "This is some very long comment text",
            creationDate: .init(timeIntervalSinceNow: -500)
        ),
        Comment(
            id: UUID(uuidString: "7a3af137-50a3-40f5-aeb9-4eceb16f4998")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            postID: UUID(uuidString: "f5cc5eb5-8049-47c6-89f8-2522878c8d21")!,
            text: "This is some very long comment text",
            creationDate: .init(timeIntervalSinceNow: -500)
        ),
        Comment(
            id: UUID(uuidString: "98e2318e-fa6e-457c-99da-ce8a5d9f470e")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            postID: UUID(uuidString: "a1fd730e-0b87-451a-8163-602050920f42")!,
            text: "This is some very long comment text",
            creationDate: .init(timeIntervalSinceNow: -500)
        ),
        Comment(
            id: UUID(uuidString: "168fc86d-8bce-41dc-89b6-f21f0434a02e")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            postID: UUID(uuidString: "ccf509b2-b26a-4f75-bddc-9e7946e33ae1")!,
            text: "This is some very long comment text",
            creationDate: .init(timeIntervalSinceNow: -500)
        )
    ])
    
    static var aComment: Comment {
        comments.randomElement()!
    }
    
    static var discounts = Set<Discount>([
        Discount(
            id: UUID(),
            storeName: "Apple",
            name: "iPhone 12 Pro",
            requiredPoints: 1000,
            description: "Get 50% off an iPhone 12 Pro with 1000 points!"
        )
    ])
    
    static var aDiscount: Discount {
        discounts.randomElement()!
    }
    
    static var posts = Set<Post>([
        Post(
            id: UUID(uuidString: "61bede89-8de3-42d4-9cc8-351f57ded067")!,
            authorID: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            description: "An example post",
            url: imageURL,
            comments: [
                UUID(uuidString: "f6d04991-deb7-4e43-8741-b86140774513")!
            ]
        ),
        Post(
            id: UUID(uuidString: "f5cc5eb5-8049-47c6-89f8-2522878c8d21")!,
            authorID: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            description: "An example post",
            url: imageURL,
            comments: [
                UUID(uuidString: "7a3af137-50a3-40f5-aeb9-4eceb16f4998")!
            ]
        ),
        Post(
            id: UUID(uuidString: "a1fd730e-0b87-451a-8163-602050920f42")!,
            authorID: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            description: "An example post",
            url: imageURL,
            comments: [
                UUID(uuidString: "98e2318e-fa6e-457c-99da-ce8a5d9f470e")!
            ]
        ),
        Post(
            id: UUID(uuidString: "ccf509b2-b26a-4f75-bddc-9e7946e33ae1")!,
            authorID: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            description: "An example post",
            url: imageURL,
            comments: [
                UUID(uuidString: "168fc86d-8bce-41dc-89b6-f21f0434a02e")!
            ]
        )
    ])
    
    static var aPost: Post {
        posts.randomElement()!
    }
    
    static var users = Set<User>([
        User(
            id: UUID(uuidString: "c28e6c3e-d720-482b-8062-ebb82798c600")!,
            username: "userone",
            name: "User 1",
            bio: "The first ever user!",
            profilePictureURL: imageURL,
            posts: [
                UUID(uuidString: "61bede89-8de3-42d4-9cc8-351f57ded067")!
            ]
        ),
        User(
            id: UUID(uuidString: "9c01220d-4acb-4282-b0b7-306fb2b9f9b1")!,
            username: "usertwo",
            name: "User 2",
            bio: "The second ever user!",
            profilePictureURL: imageURL,
            posts: []
        ),
        User(
            id: UUID(uuidString: "d2db228e-5d9d-4479-b81a-a9521ff5c63e")!,
            username: "userthree",
            name: "User 3",
            bio: "The third ever user!",
            profilePictureURL: imageURL,
            posts: [
                UUID(uuidString: "f5cc5eb5-8049-47c6-89f8-2522878c8d21")!,
                UUID(uuidString: "a1fd730e-0b87-451a-8163-602050920f42")!,
                UUID(uuidString: "ccf509b2-b26a-4f75-bddc-9e7946e33ae1")!
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
