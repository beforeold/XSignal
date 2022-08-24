//
//  SwiftAPITest.swift
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

import Foundation
import Combine

let signal = XSGGenerator { (sb) -> Any? in
    sb.receive(5)
    sb.receive(completion: .finished)
    return nil
}


@objc class SomeClass: NSObject {
    @objc func receive(completion: XSGCompletion) {
        
    }
}
