//  main.swift
//  VigenereCipher
//  Copyright © 2019 Stephen Alger. All rights reserved.


import Foundation

print("Enter Your KEY: ", terminator: "")
var cipherKey = readLine()
cipherKey = cipherKey?.uppercased()

let cipherInstance = VigenereCipher(cipherKey: cipherKey!)

print("Enter Your Message: ", terminator: "")
var originalMsg = readLine()
originalMsg = originalMsg?.uppercased()

let encryptedString = cipherInstance.encryptionFunc(originalMsg: originalMsg!)

print("Encrypted Message: [\(encryptedString)]")
print("Deciphered Back: [\(cipherInstance.decryptionFunc(encryptedMsg: encryptedString))]")
