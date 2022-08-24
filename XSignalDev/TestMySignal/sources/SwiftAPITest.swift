//
//  SwiftAPITest.swift
//  TestMySignal
//
//  Created by beforeold on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

import Foundation
import Combine

let signal = XSGGenerator { (sub) -> Any? in
    sub.receive(5)
    sub.receive(completion: .finished)
    return nil
}


@objc class SomeClass: NSObject {
    @objc func receive(completion: XSGCompletion) {
        
    }
}
