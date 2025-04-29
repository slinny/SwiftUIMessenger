//
//  String+Extensions.swift
//  SwiftUIMessenger
//
//  Created by Siran Li on 4/29/25.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool { return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}
