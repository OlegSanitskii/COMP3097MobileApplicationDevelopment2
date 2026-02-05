import Foundation

// Lab Exercise 4 — Functions

// Exercise 1
func printHelloWorld() { print("Hello, World!") } // prints exactly as required

// Exercise 2
func greet(name: String) { print("Hello, \(name)!") } // prints greeting

// Exercise 3
func greeting(name: String) -> String { "Hello, \(name)!" } // returns greeting string

// Exercise 4
func greet(firstName: String, lastName: String) { print("Hello, \(firstName) \(lastName)!") } // prints greeting

// Exercise 5
func split(name: String) -> (first: String, last: String) {
    let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
    if trimmed.isEmpty { return ("", "") } 

    let parts = trimmed.split(whereSeparator: { $0 == " " }).map(String.init)

    if parts.count == 1 { return (parts[0], "") }
    return (parts[0], parts[parts.count - 1])     
}

// Exercise 6
func square(_ x: Int) -> Int { x * x } 

// Exercise 7
func whoAmI(name: String = "Bruce Wayne") -> String {
    return (name == "Bruce Wayne") ? "I am Batman" : "I am not Batman"
}

// Exercise 8
func sum(_ numbers: Int...) -> Int {
    var total = 0
    for n in numbers { total += n }
    return total
}

// =========================
// Quick demo / test calls
// =========================

printHelloWorld()

greet(name: "Donald Trump")

let s = greeting(name: "Donald Trump")
print(s)

greet(firstName: "Donald", lastName: "Trump")

print(split(name: "Donald Trump"))                 // (first: "Donald", last: "Trump")
print(split(name: "Batman"))                       // (first: "Batman", last: "")
print(split(name: ""))                             // (first: "", last: "")
print(split(name: "Dwayne \"The Rock\" Johnson"))  // (first: "Dwayne", last: "Johnson")

print(square(3))                                   // 9

print(whoAmI())                                    // default param => "I am Batman"
print(whoAmI(name: "Clark Kent"))                  // "I am not Batman"

print(sum(1, 2, 3, 4, 5))                           // 15
print(sum())                                        // 0 (valid: sum of no numbers)
