//
//  Integer+Extension.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//

extension Int {
    func formatCompactStyle() -> String {
        let formatted = self.formatted(.number)
        return formatted
    }
}
