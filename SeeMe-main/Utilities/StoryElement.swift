//
//  StoryElement.swift
//  
//
//  Created by Francesco De Stasio on 12/04/23.
//

import Foundation

public class StoryElement {
    let string : String
    let responses : [ButtonFields]
    
    init(string: String, responses: [ButtonFields]) {
        self.string = string
        self.responses = responses
    }
    
}
