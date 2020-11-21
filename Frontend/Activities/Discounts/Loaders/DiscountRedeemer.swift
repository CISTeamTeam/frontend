//
//  DiscountRedeemer.swift
//  Frontend
//

import Combine
import Foundation

/// A poster that redeems discounts
class DiscountRedeemer: Poster {
    /// A representation of a redemption request
    struct Redemption: Codable, Hashable {
        /// The ID of the user redeeming the discount
        let userID: ID
        
        /// The discount to redeem
        let discount: Discount
    }
    
    /// Whether a request is currently in progress.
    @Published var isLoading = false
    
    /// An error, if one occurred.
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the poster
    private let endpoint = "spendPoints"
    
    init() { }
    
    deinit {
        cancel()
    }
    
    /// Creates a `URLRequest` used to redeem a discount
    /// - Parameter redemption: A representation of a redemption request
    /// - Returns: A URL request
    func createRequest(for redemption: Redemption) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = UserPoints(id: redemption.userID, points: redemption.discount.requiredPoints)
        return .postRequest(url: url, body: body)
    }
}
