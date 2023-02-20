//
//  Beer.swift
//  Homework
//
//  Created by Artem on 20.02.2023.
//

import Foundation

//MARK: - Beer
struct Beer: Codable {
    let name, description: String?
    let imageURL: String?
    let boilVolume: BoilVolume?
    let ingredients: Ingredients?
    let foodPairing: [String]?

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case imageURL = "image_url"
        case boilVolume = "boil_volume"
        case ingredients
        case foodPairing = "food_pairing"
    }
}

// MARK: - BoilVolume
struct BoilVolume: Codable {
    let value: Double?
    let unit: Unit?
}

enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
}

// MARK: - Ingredients
struct Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
}

// MARK: - Hop
struct Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add: Add?
    let attribute: Attribute?
}

enum Add: String, Codable {
    case dryHop = "dry hop"
    case end = "end"
    case fv = "FV"
    case middle = "middle"
    case start = "start"
}

enum Attribute: String, Codable {
    case aroma = "aroma"
    case bitter = "bitter"
    case flavour = "flavour"
    case twist = "twist"
}

// MARK: - Malt
struct Malt: Codable {
    let name: String?
    let amount: BoilVolume?
}

typealias Beers = [Beer]
