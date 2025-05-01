//
//  CoffeemateTests.swift
//  CoffeemateTests
//
//  Created by Christoph Rohde on 27.02.25.
//

@testable import Coffeemate
import SwiftyJSON
import Testing

struct CoffeemateTests {
    @Test func swiftyJSONTest() throws {
        struct Person {
            let name: String
            let age: Int
        }
        print("Test 1")
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let personJSON = JSON([
            "name": "John Doe",
            "age": 30
        ])

        let name = personJSON["name"].stringValue
        let age = personJSON["age"].intValue
        let person = Person(name: name, age: age)

        #expect(person.name == "John Doe")
        #expect(person.age == 30)
    }
}
