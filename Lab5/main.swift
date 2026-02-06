import Foundation

// --------------------
// Exercise 5.1
// --------------------
print("Exercise 5.1\n")

for i in 1...5 {
    print(i)
    print()
}

// --------------------
// Exercise 5.2
// --------------------
print("Exercise 5.2\n")

let array1 = [1, 2, 3, 4, 5]
for value in array1 {
    print(value)
    print()
}

// --------------------
// Exercise 5.3
// --------------------
print("Exercise 5.3\n")

let array2 = [2, 6, 11, 19, 25]
for index in 0..<array2.count {
    print(array2[index])
    print()
}

// --------------------
// Exercise 5.4
// --------------------
print("Exercise 5.4\n")

for index in 0..<array2.count {
    print("Index \(index): \(array2[index])")
    print()
}

// --------------------
// Exercise 5.5
// --------------------
print("Exercise 5.5\n")

var counter = 0
while counter < 10 {
    counter += 1
    print(counter)
    print()
}

// --------------------
// Exercise 5.6
// --------------------
print("Exercise 5.6\n")

var counter2 = 0
repeat {
    counter2 += 1
    print(counter2)
    print()
} while counter2 < 10

// --------------------
// Exercise 5.7
// --------------------
print("Exercise 5.7\n")

let temperature = 15

if temperature >= 30 {
    print("It's too hot")
} else if temperature < 0 {
    print("It's too cold")
} else {
    print("It's tolerable")
}

print()

// --------------------
// Exercise 5.8
// --------------------
print("Exercise 5.8\n")

let stringValue = "1337"

if let number = Int(stringValue), number == 1337 {
    print("The value is 1337")
}

print()

// --------------------
// Exercise 5.9
// --------------------
print("Exercise 5.9\n")

let value = 1337

switch value {
case 1337:
    print("elite")
case 42:
    print("the meaning of life")
default:
    print("some number")
}

print()

// --------------------
// Exercise 5.10
// --------------------
print("Exercise 5.10\n")

switch value {
case 42, 1337, 4711:
    print("a number we care about")
default:
    print("who cares")
}

print()

// --------------------
// Exercise 5.11
// --------------------
print("Exercise 5.11\n")

let animal = "tiger"

switch animal {
case "tiger":
    print("Animal is a tiger")
    fallthrough
case "cat":
    print("Animal is a cat")
default:
    print("Animal is some other type of animal")
}

print()

// --------------------
// Exercise 5.12
// --------------------
print("Exercise 5.12\n")

let distance: UInt = 10

switch distance {
case 0:
    print("Here")
case 1..<5:
    print("Immediate vicinity")
case 5...15:
    print("Near")
case 16...40:
    print("Kind of far")
default:
    print("Far")
}

print()

// --------------------
// Exercise 5.13
// --------------------
print("Exercise 5.13\n")

let vector3D1 = (x: 3, y: 2, z: 5)

switch vector3D1 {
case let (_, y, z) where z == 5:
    print(y)
case let (x, y, _) where x == 12:
    print(y)
default:
    break
}

print()

// --------------------
// Exercise 5.14
// --------------------
print("Exercise 5.14\n")

let vector3D2 = (x: 3, y: 2, z: 6)

switch vector3D2 {
case let (x, y, z) where z == y * 3:
    print(x)
default:
    break
}

print()

// --------------------
// Exercise 5.15
// --------------------

// With 2 guards
func printIfPositiveInteger2(number: String) {
    guard let value = Int(number) else { return }
    guard value > 0 else { return }
    print(value)
}

// With compound guard
func printIfPositiveInteger3(number: String) {
    guard let value = Int(number), value > 0 else { return }
    print(value)
}

print("Exercise 5.15\n")

printIfPositiveInteger2(number: "abc")
printIfPositiveInteger2(number: "-10")
printIfPositiveInteger2(number: "20")

print()

printIfPositiveInteger3(number: "abc")
printIfPositiveInteger3(number: "-10")
printIfPositiveInteger3(number: "10")
