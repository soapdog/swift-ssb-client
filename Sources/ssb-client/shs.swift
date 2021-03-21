//
//  shs.swift
//  
//  Secret Handshake
//
//  Created by Andre Alves Garzia on 21/03/2021.
//
// URLs being used as references:
//
// * https://github.com/cryptoscope/secretstream/blob/ad7542b0cbda422a1ea3de7efa62a514672a2c88/secrethandshake/state.go
// * https://ssbc.github.io/scuttlebutt-protocol-guide/#peer-connections
// * https://github.com/pferreir/PySecretHandshake/blob/master/secret_handshake/crypto.py
//
// PS: I hate dealing with crypto...

import Foundation
import Sodium
import Clibsodium

let sodium = Sodium()

let APPLICATION_KEY = "1KHLiKZvAvjbY1ziZEHMXawbCEIM6qwjCDm3VYRan/s=".data(using: .utf8)?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue:0))

struct EdKeyPair {
    var Public = Bytes(repeating: 0, count: 32)
    var Secret = Bytes(repeating: 0, count: 64)
}

struct CurveKeyPair {
    var Public = Bytes(repeating: 0, count: 32)
    var Secret = Bytes(repeating: 0, count: 32)
}

struct State {
    var appKey, secHash: Bytes?
    var localAppMac, remoteAppMac: Bytes?
    
    var localExchange: CurveKeyPair?
    var local: EdKeyPair?
    var remoteExchange: CurveKeyPair?
    var remotePublic = Bytes(repeating: 0, count: 32)
    
    var secret = Bytes(repeating: 0, count: 32)
    var secret2 = Bytes(repeating: 0, count: 32)
    var secret3 = Bytes(repeating: 0, count: 32)
    
    var hello: Bytes?
    
    var aBob = Bytes(repeating: 0, count: 32)
    var bAlice = Bytes(repeating: 0, count: 32)
}

func NewState(appKey appKeyV: Bytes,
              local localV: EdKeyPair) -> State
{
    let keyPair = sodium.box.keyPair()!
    
    let s = State(appKey: appKeyV,
                  localExchange: CurveKeyPair(Public: keyPair.publicKey, Secret: keyPair.secretKey),
                  local: localV)
    
    return s
}

func NewClientState(appKey appKeyV: Bytes,
                    local localV: EdKeyPair,
                    remotePublic remotePublicV: Bytes = Bytes(repeating: 0, count: 32)) -> State
{

    var state = NewState(appKey: appKeyV, local: localV)
    
    state.remotePublic = remotePublicV
    
    return state
}

func NewServerState(appKey appKeyV: Bytes,
              local localV: EdKeyPair) -> State
{
   return NewState(appKey: appKeyV, local: localV)
}

extension State {
    func createChallenge() -> Bytes? {
        
    }
}
