//
//  ErrorMsgHandler.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 23/06/2022.
//

import Foundation

enum ErrorMessages: String,Error {
    
    case noInternet = "No Internet Please Check Your Connection"
    case invalidUrl = "invalid URL, Please try again later"
    case invalidResponse = "Invalid response from the server, Please try again later"
    case invalidData = "The data recived from the server is invalid"
    case invalidDataAfterDecoding = "Invalid after decoding"
    case errorRetivingFromCoreData = "Couldn't retrive from core data"
}
