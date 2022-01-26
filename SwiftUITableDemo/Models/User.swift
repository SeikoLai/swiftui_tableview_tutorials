//
//  Person.swift
//  SwiftUITableDemo
//
//  Created by Sam Lai on 2022/1/25.
//

import Foundation

enum UserKey: String, CodingKey {
    case gender, name, location, email, login, dob, registered, phone, cell, picture, nat, id
}

enum LocationKey: String, CodingKey {
    case street, city, state, country, postcode, coordinates, timezone
}

struct Name: Hashable, Codable {
    var title: String
    var first: String
    var last: String
}

struct Street: Hashable, Codable {
    var number: Int
    var name: String
}

struct Coordinates: Hashable, Codable {
    var latitude: String
    var longitude: String
}

struct Timezone: Hashable, Codable {
    var offset: String
    var description: String
}

struct Location: Hashable {
    var street: Street
    var city: String
    var state: String
    var country: String
    var postcode: Int
    var coordinates: Coordinates
    var timezone: Timezone
}

extension Location: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LocationKey.self)
        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        if let temp = try? container.decode(String.self, forKey: .postcode) {
            postcode = Int(temp) ?? 0
        }
        else if let temp = try? container.decode(Int.self, forKey: .postcode) {
            postcode = temp
        }
        else {
            postcode = 0
        }
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        timezone = try container.decode(Timezone.self, forKey: .timezone)
    }
}

struct Login: Hashable, Codable {
    var uuid: String
    var username: String
    var password: String
    var salt: String
    var md5: String
    var sha1: String
    var sha256: String
}

struct Dob: Hashable, Codable {
    var date: String
    var age: Int
}

struct Registered: Hashable, Codable {
    var date: String
    var age: Int
}

struct Picture: Hashable, Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

struct Identifier: Hashable, Codable {
    var name: String
    var value: String
}

struct User: Hashable, Identifiable {
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var login: Login
    var dob: Dob
    var registered: Registered
    var phone: String
    var cell: String
    var picture: Picture
    var nat: String
    var identifier: Identifier?
    
    var id = UUID()
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserKey.self)
        gender = try container.decode(String.self, forKey: .gender)
        name = try container.decode(Name.self, forKey: .name)
        location = try container.decode(Location.self, forKey: .location)
        email = try container.decode(String.self, forKey: .email)
        login = try container.decode(Login.self, forKey: .login)
        dob = try container.decode(Dob.self, forKey: .dob)
        registered = try container.decode(Registered.self, forKey: .registered)
        phone = try container.decode(String.self, forKey: .phone)
        cell = try container.decode(String.self, forKey: .cell)
        picture = try container.decode(Picture.self, forKey: .picture)
        nat = try container.decode(String.self, forKey: .nat)
        identifier = try? container.decode(Identifier.self, forKey: .id)
    }
}
