
// Lab Exercise 1 – Basics
// Student: Oleg Sanitskii 101466133


// ------------------------------------------------------------
// Exercise 1.1
// A variable declared with 'var' can be modified after initialization.
// ------------------------------------------------------------
print("---- Exercise 1.1 ----")
var temperature: Double = 22.5
temperature = 18.0
print("temperature =", temperature)
print()


// ------------------------------------------------------------
// Exercise 1.2
// A constant declared with 'let' cannot be changed after it is assigned.
// ------------------------------------------------------------
print("---- Exercise 1.2 ----")
let secondsInHour: Int = 3600
print("secondsInHour =", secondsInHour)

// secondsInHour = 7200 // Error: 'let' constants are immutable
print()


// ------------------------------------------------------------
// Exercise 1.3
// Swift supports both explicit type annotations and type inference.
// ------------------------------------------------------------
print("---- Exercise 1.3 ----")
var age: Int = 26        // explicit type annotation
var score = 100          // type inferred by Swift as Int
print("age =", age, "| score =", score)
print()


// ------------------------------------------------------------
// Exercise 1.4
// A constant can be initialized later, but only once.
// ------------------------------------------------------------
print("---- Exercise 1.4 ----")
let wheels: Int
wheels = 4
print("wheels =", wheels)
print()


// ------------------------------------------------------------
// Exercise 1.5
// Swift allows Unicode characters (including Greek letters) in identifiers.
// ------------------------------------------------------------
print("---- Exercise 1.5 ----")
let π = 3.141592653589793
print("π =", π)
print()


// ------------------------------------------------------------
// Exercise 1.6
// Swift also allows emoji characters as variable names.
// ------------------------------------------------------------
print("---- Exercise 1.6 ----")
var 🐱 = "Nikki"
print("🐱 =", 🐱)
print()


// ------------------------------------------------------------
// Exercise 1.7
// String constants are immutable once assigned.
// ------------------------------------------------------------
print("---- Exercise 1.7 ----")
let city = "Toronto"
print("city =", city)
print()


// ------------------------------------------------------------
// Exercise 1.8
// Int16 has a maximum value of 32767.
// ------------------------------------------------------------
print("---- Exercise 1.8 ----")
print("Int16.max =", Int16.max)
print()


// ------------------------------------------------------------
// Exercise 1.9
// When an expression contains a floating-point literal,
// Swift infers the type as Double.
// ------------------------------------------------------------
print("---- Exercise 1.9 ----")
let pi = 3 + 0.141592654
print("pi =", pi)
print("type(of: pi) =", type(of: pi))
print()


// ------------------------------------------------------------
// Exercise 1.10
// UInt is an unsigned integer type and cannot store negative values.
// ------------------------------------------------------------
print("---- Exercise 1.10 ----")
// let myNumber: UInt = -17 // Compilation error
print()


// ------------------------------------------------------------
// Exercise 1.11
// Int16 cannot store values larger than 32767 (overflow).
// ------------------------------------------------------------
print("---- Exercise 1.11 ----")
// let bigNumber: Int16 = 32767 + 1 // Out of range
print()


// ------------------------------------------------------------
// Exercise 1.12
// Swift does not allow implicit type conversion.
// Explicit conversion from Double to Int is required.
// ------------------------------------------------------------
print("---- Exercise 1.12 ----")
let pi2 = 3.141592654
let approximatePi: Int = Int(pi2)   // fractional part is discarded
print("pi2 =", pi2, "| approximatePi =", approximatePi)
print()


// ------------------------------------------------------------
// Exercise 1.13 (Extra Credit)
// Int16 uses two’s complement representation.
// Both expressions evaluate to -32768.
// ------------------------------------------------------------
print("---- Exercise 1.13 ----")
let valueA: Int16 = -0x8000
let valueB: Int16 = 0x4000 << 1
print("valueA =", valueA)
print("valueB =", valueB)
print("valueA == valueB ->", valueA == valueB)
print()


// ------------------------------------------------------------
// Exercise 1.15
// Swift supports nested multi-line comments.
// ------------------------------------------------------------
print("---- Exercise 1.15 ----")
/*
 Outer comment
    /*
     Inner comment
    */
 End of outer comment
*/
print("Nested comments example")
print()


// ------------------------------------------------------------
// Exercise 1.16
// A tuple groups multiple values into a single compound value.
// ------------------------------------------------------------
print("---- Exercise 1.16 ----")
let player = (number: 8, name: "Igor Larionov")
print("player =", player)
print()


// ------------------------------------------------------------
// Exercise 1.17
// Tuple values can be accessed by destructuring, index, or field names.
// ------------------------------------------------------------
print("---- Exercise 1.17 ----")

// Destructuring
let (number, name) = player
print("Destructuring ->", number, name)

// Index access
let number2 = player.0
let name2 = player.1
print("By index ->", number2, name2)

// Named fields
let number3 = player.number
let name3 = player.name
print("By names ->", number3, name3)
print()


// ------------------------------------------------------------
// Exercise 1.18
// Optional constants can store either a value or nil.
// ------------------------------------------------------------
print("---- Exercise 1.18 ----")
let maybeAge: Int? = 26
let maybeNothing: Int? = nil
print("maybeAge =", maybeAge as Any)
print("maybeNothing =", maybeNothing as Any)
print()


// ------------------------------------------------------------
// Exercise 1.19
// An optional must be unwrapped before assigning it to a non-optional value.
// ------------------------------------------------------------
print("---- Exercise 1.19 ----")
let value19: Int? = 17
let banana19: Int = value19!   // force unwrap (unsafe if nil)
print("banana19 =", banana19)
print()


// ------------------------------------------------------------
// Exercise 1.20
// Force unwrapping a nil optional causes a runtime crash.
// ------------------------------------------------------------
print("---- Exercise 1.20 ----")
let value20: Int? = nil
// let banana20: Int = value20! // Runtime crash if uncommented
print()


// ------------------------------------------------------------
// Exercise 1.21
// The safest way to unwrap an optional is using 'if let' or '??'.
// ------------------------------------------------------------
print("---- Exercise 1.21 ----")
let value21: Int? = nil

if let unwrapped = value21 {
    print("banana21 =", unwrapped)
} else {
    print("value21 is nil (safe path)")
}

// Nil-coalescing operator provides a default value
let banana21Default = value21 ?? 0
print("banana21Default =", banana21Default)
print()
