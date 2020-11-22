//
//  CommentInfo.swift
//  Frontend
//

import SwiftUI

/// A view that shows a comment and its author
struct CommentInfo: View {
    /// The comment to show
    let comment: Comment
    
    /// The contents of the view
    var body: some View {
        VStack(spacing: 4) {
            UserUsernameLabel(userID: comment.userID)
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
    
    /// A date formatter used to format the comment's creation date
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
