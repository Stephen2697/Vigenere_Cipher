//  VigenereCipher.swift
//  VigenereCipher
//  Copyright © 2019 Stephen Alger. All rights reserved.

class VigenereCipher {
    
    //Declare constants which will be Hardcoded in intialiser
    let ALPHABETSIZE: Int
    let ALPHABET: String
    
    //Declare key constants
    let cipherKey: String
    let keyLength: Int

    //Initialiser
    init(ALPHABET: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", cipherKey: String) {
        
        //set attributes & perform to Uppercase conversion
        self.ALPHABET = ALPHABET.uppercased()
        self.ALPHABETSIZE = ALPHABET.count
        
        self.cipherKey = cipherKey.uppercased()
        self.keyLength = cipherKey.count
        
    }

    //MARK: getAlphabetPosition - gets the alphabet index of any given character
    private func getAlphabetPosition(character: Character) -> Int {
        var index = 0

        //Iterate through alphabet, returning
        for char in ALPHABET {
            
            if char == character {
                return index
            }
            
            index += 1
        }

        return -1
    }
    
    //MARK: encryptionFunc - take one parameter (message to encipher), return enciphered string
    func encryptionFunc(originalMsg: String) -> String {
        
        //establish required variables
        var returnMsg = ""
        var index = 0
        let firstIndex: String.Index = cipherKey.startIndex

        //swift style for loop
        for character in originalMsg {
            
            //char by char obtain the index of the char in the Alphabet
            let originalCharIndex = getAlphabetPosition(character: character)

            //If character is not in alphabet i.e. whitespace - simply append to encrypted
            if originalCharIndex == -1 {
                returnMsg.append(character)
                
                //iterate loop
                continue
            }

            //deal with encryption key

            //select character from key to encrypt this character from the original message using modulo arithmetic
            let charToEncryptWith: Character = cipherKey[cipherKey.index(firstIndex, offsetBy: index % keyLength)]
            
            //get the alphabet position of the encryption character just selected
            let encryptionCharIndex = getAlphabetPosition(character: charToEncryptWith)
            
            //Get the Vigenere encryption chars index - i.e. Use the formula to get the characters index that will replace the original character in the original msg [(originalCharIndex + encryptionCharIndex + 26) Modulo 26]
            let encryptedLetterIndex = (originalCharIndex + encryptionCharIndex + ALPHABETSIZE) % ALPHABETSIZE
            
            //append this encrypted letter to the returnMsg 
            returnMsg.append(ALPHABET[ALPHABET.index(firstIndex, offsetBy: encryptedLetterIndex)])
            
            
            //iterate index
            index += 1
        }

        return returnMsg
    }

    //MARK: decryptionFunc - take one parameter (message to decipher), return deciphered string
    func decryptionFunc(encryptedMsg: String) -> String {
        var returnMsg = ""
        var index = 0
        let firstIndex: String.Index = cipherKey.startIndex

        for character in encryptedMsg {
        
            let originalCharIndex = getAlphabetPosition(character: character)

            //If character is not in alphabet i.e. whitespace - simply append to returnMsg
            if originalCharIndex == -1 {
                returnMsg.append(character)
                
                //iterate loop
                continue
            }

            //select character from key to decrypt character from the encrypted message using modulo arithmetic
            let charToEncryptWith: Character = cipherKey[cipherKey.index(firstIndex, offsetBy: index % keyLength)]
            
            //Get the decryption character index in alphabet
            let decryptionCharIndex = getAlphabetPosition(character: charToEncryptWith)
            
            //Get the decrypted letter's index in the alphabet
            let decryptedLetterIndex = (originalCharIndex - decryptionCharIndex + ALPHABETSIZE) % ALPHABETSIZE
            
            //append this decrypted letter to the returnMsg 
            returnMsg.append(ALPHABET[ALPHABET.index(firstIndex, offsetBy: decryptedLetterIndex)])
            
            //iterate index
            index += 1
        }

        return returnMsg
    }

    
}

