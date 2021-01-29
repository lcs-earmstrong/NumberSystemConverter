//
//  main.swift
//  NumberSystemConverter
//
//  Created by Evan Armstrong on 2021-01-26.
//

import Foundation

// INPUT
enum numberSystemBase: Int {
    case binary = 2   // is the raw value for this case
    case octal = 8   // is the raw value for this case
    case decimal = 10
    case hexidecimal = 16  // is the raw value for this case
}

func getDecimalEquivalent(of value: String, from numberSystem: numberSystemBase) -> Double {
    
    // What base are we converting from?
    var base = 0.0
    switch numberSystem {
    case .binary:
        base = 2.0
    case .octal:
        base = 8.0
    case .hexidecimal:
        base = 16.0
    case .decimal:
        base = 10.0
    }
    
    let exponent = 0.0
    
    var decimalEquivalent = 0.0
    
    for character in value.reversed(){
        
        if let digit = Double(String(character)) {
        
        decimalEquivalent += digit * pow (base, exponent)
        

    } else {

        switch character {
        case "A":
            decimalEquivalent += 10.0 * pow (base, exponent)
        case "B":
            decimalEquivalent += 11.0 * pow (base, exponent)
        case "C":
            decimalEquivalent += 12.0 * pow (base, exponent)
        case "D":
            decimalEquivalent += 13.0 * pow (base, exponent)
        case "E":
            decimalEquivalent += 14.0 * pow (base, exponent)
        case "F":
            decimalEquivalent += 15.0 * pow (base, exponent)
        default:
            break
          }
        
}
    }
        return decimalEquivalent
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
// What base are we converting from?

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

// Create a variable that will store the "from" number system in a data type that is compatible with the function



var fromBase = numberSystemBase.binary

switch from {
case "B" :
    fromBase = .binary
case "O" :
    fromBase = .octal
case "D" :
    fromBase = .decimal
case "H" :
    fromBase = .hexidecimal
    
default:
    print("Not a Usable Value")
}


var endBase = numberSystemBase.binary
switch from {
case "B" :
    endBase = .binary
case "O" :
    endBase = .octal
case "D" :
    endBase = .decimal
case "H" :
    endBase = .hexidecimal
default:
    print ("Please Enter a Valid Value")
}


let decimal = getDecimalEquivalent(of: value!, from: fromBase)
let output = getRepresentation(of: Int(decimal), inBase: endBase)
// Call or use the function

// OUTPUT

print(output)
