//
//  IStory.swift
//  SeeMe
//
//  Created by Francesco De Stasio on 12/04/23.
//

import Foundation
protocol IStory {
    func getDialogsAndResponses() -> [StoryElement]
    func getEndingAndResponses() -> [StoryElement]
    func getQuestionsAndResponses() -> [StoryElement]
    func getAllOrdered() -> [StoryElement]
}
