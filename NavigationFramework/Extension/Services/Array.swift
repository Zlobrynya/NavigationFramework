//
//  Array.swift
//  Array
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import Foundation

extension Array where Array.Element == NavigationDataProtocol {
    func isLast(forId id: UUID) -> Bool {
        guard let last = self.last else { return false }
        return last.id == id
    }
}
