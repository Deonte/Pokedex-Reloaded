//
//  ErrorMessage.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 1/4/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import Foundation

enum PRError: String {
    case invalidURL = "This URL created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
}

