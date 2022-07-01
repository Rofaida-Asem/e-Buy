//
//  CheckEmail.swift
//  e-Buy
//
//  Created by salah waleed on 01/07/2022.
//

import Foundation
 
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
