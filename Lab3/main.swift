// Lab Exercise 3
// Collection Types

import Foundation

// Exercise 3.1
var arr1: [Int] = []
var arr2 = [Int]()
var arr3: Array<Int> = []
var arr4 = Array<Int>()

// Exercise 3.2
let numbers1 = [4, 8, 15, 16, 23, 42]
let numbers2: [Int] = [4, 8, 15, 16, 23, 42]
let numbers3 = Array([4, 8, 15, 16, 23, 42])
let numbers4: Array<Int> = [4, 8, 15, 16, 23, 42]

// Exercise 3.3
let immutableNumbers = [4, 8, 15, 16, 23, 42]

// Exercise 3.4
var stuff = [4, 8, 15, 16, 23, 42]
stuff.append(1138)
stuff.append(1337)
stuff.append(4711)

// Exercise 3.5
var numbers = [4, 8, 15, 16, 23, 42]
numbers[2] = 17

// Exercise 3.6
var numbersForReplace = [4, 8, 15, 16, 23, 42]
numbersForReplace.replaceSubrange(2...4, with: [1, 2, 3, 4, 5])

// Exercise 3.7
let sheep = Array(repeating: "🐑", count: 10)
print("Number of sheep:", sheep.count)
print()

// Exercise 3.8
var items = [1, 2, 3, 4, 5]
if !items.isEmpty {
    items.removeLast()
}

// Exercise 3.9
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

let isSubset = houseAnimals.isSubset(of: farmAnimals)
let isSuperset = farmAnimals.isSuperset(of: houseAnimals)
let isDisjoint = farmAnimals.isDisjoint(with: cityAnimals)
let farmOnly = farmAnimals.subtracting(houseAnimals)
let allAnimals = houseAnimals.union(farmAnimals).union(cityAnimals)

print("House ⊆ Farm:", isSubset)
print()

print("Farm ⊇ House:", isSuperset)
print()

print("Farm disjoint City:", isDisjoint)
print()

print("Farm only:", farmOnly)
print()

print("All animals:", allAnimals)
print()

// Exercise 3.10
var dict1: [String: Int] = [:]
var dict2 = [String: Int]()
var dict3: Dictionary<String, Int> = [:]
var dict4 = Dictionary<String, Int>()

// Exercise 3.11
var secretIdentities = [
    "Hulk": "Bruce Banner",
    "Batman": "Bruce Wayne",
    "Superman": "Clark Kent"
]

// Exercise 3.12
print("Batman is", secretIdentities["Batman"] ?? "Unknown")
print()

// Exercise 3.13
secretIdentities["Hulk"] = "David Banner"

// Exercise 3.14
for (hero, identity) in secretIdentities {
    print("\(hero) is \(identity)")
    print()
}
