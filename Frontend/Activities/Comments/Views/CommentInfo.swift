//
//  CommentInfo.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct CommentInfo: View {
    let comment: Comment
    
    var body: some View {
        VStack(spacing: 4) {
            UserUsernameLabel(userID: comment.authorID)
                .alignedHorizontally(to: .leading)
            Text(comment.text)
                .font(.callout)
                .alignedHorizontally(to: .leading)
            Text(comment.creationDate, formatter: dateFormatter)
                .font(.caption2)
                .foregroundColor(.secondary)
                .alignedHorizontally(to: .leading)
        }
    }
    
    private var dateFormatter: Formatter {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter
    }
}

struct CommentInfo_Previews: PreviewProvider {
    static var previews: some View {
        CommentInfo(comment: Placeholders.aComment)
    }
}
