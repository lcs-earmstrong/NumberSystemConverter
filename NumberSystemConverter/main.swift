//
//  main.swift
//  NumberSystemConverter
//
//  Created by Evan Armstrong on 2021-01-26.
//

import Foundation

// INPUT

// Get the "from" number system
print("What number system do you want to convert from?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice(B/O/D/H): ", terminator: "") // Keep following output
                                                      // On the same line
let from = readLine()!
print(from)

print("What do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice(B/O/D/H): ", terminator: "")

let from1 = readLine()
print(from1!)

print("What number do you want to convert?", terminator: "")
let value = readLine()
// PROCESS


func
    let value = Int()
//
// What base are we converting from
let base = 2.0
//
// The exponent value at the right most digit
var exponent = 0.0
//
// the current sum in decimal
var decimalEquivalent = 0.0
//
// Iterate over each character
// From right to left!
for character in value.reversed() {
    
    // Get the current digit as a double (decimal)
    if let digit = Double(String(character)){
        
        // Add the current sum
       decimalEquivalent += digit * pow (base, exponent)
        
        // Increment the exponent
        exponent += 1
    }
                                                      
}
// get the value
decimalEquivalent
}

enum numberSystemBase: Int {
    case binary = 2   // is the raw value for this case
    case octal = 8   // is the raw value for this case
    case hexidecimal = 16  // is the raw value for this case
}

func getRepresentation(of ValueToConvert: Int, inBase base: numberSystemBase) -> String  {
    
 
    // Create a variable with the value of "valueToConvert"
    //A variable Can be changed once created
    var DecimalValueLeftToConvert = ValueToConvert
    // This creates an empty string
    // A string is just text like "hello"
    var representation = ""

    //This abstraction will use is a LOOP
    // Our end condition is that the decimalValueLefttoConvert is equal to zero
    // So long as the Condition is true, the block of code surrounded by the ( ) brackets will be run repeatedly
    while DecimalValueLeftToConvert > 0 {
    //Get the next digit
        
        
        let nextDigit = DecimalValueLeftToConvert % base.rawValue
        //Add that new digit to the representation
        // Swift is Strickly Typed Language
        // It DOES NOT automatically convert data types
        // So, to make the Int into a String we need to specify this
        //
        //If Statement
        //
        //Check a condition - when true do one thing.
        //                  - when false do something else
        if base == .hexidecimal {
            // we know the base is hexidecimal (condition is true)
            
            // Carefully set the next digit
            //When something other tha 0 to 9... use ABCDEF
            //
            // A switch statement evaluates some value
            //
            // And take different actions depending on the vlue
            switch nextDigit {
            case 0...9:
                representation = String(nextDigit) + representation
            case 10:
            representation = "A" + representation
            case 11:
            representation = "B" + representation
            case 12:
            representation = "C" + representation
            case 13:
            representation = "D" + representation
            case 14:
            representation = "D" + representation
            case 15:
            representation = "F" + representation
            default:
                break
            }
        }  else  {
            // The base is octal or binary (condition was false)
            representation = String(nextDigit) + representation
        }
        
        //Get the decimal value left to convert
        DecimalValueLeftToConvert = DecimalValueLeftToConvert / base.rawValue
        
    }
    return representation
}

// Call or use the function

getRepresentation(of: 15, inBase: .hexidecimal)
// OUTPUT

