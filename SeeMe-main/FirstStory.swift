//
//  FirstStory.swift
//  SeeMe
//
//  Created by Francesco De Stasio on 05/04/23.
//

import Foundation
import SwiftUI

class FirstStory : IStory{
    
    
    static let shared = FirstStory()
    
    private init() {
        initEndingAndResponses()
        initDialogsAndResponses()
        initQuestionsAndResponses()
    }
    
    var dialogsAndResponses : [StoryElement] = []
    var questionsAndResponses : [StoryElement] = []
    var endingAndResponses : [StoryElement] = []
    
    
    private func initDialogsAndResponses(){
        dialogsAndResponses = [
            StoryElement(string: "Hello, how are you? I'm the inner you and I would like to play a game with.. me! Do you wanna join us?", responses: [ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")]),
            StoryElement(string: "Nice choice, I thought you would say no.\nAnyway, this game is called \"life\" and guess what, you are the hero! And today you will find out if you are a good person or bad person.", responses: [ButtonFields(text: "Next", backgroundColor: "SecondaryColor", textColor: "TextColor")]),
            StoryElement(string: "Don't be scared, there are just me and you. We are offline for a minute, and nobody else is watching.", responses: [ButtonFields(text: "Next", backgroundColor: "SecondaryColor", textColor: "TextColor")]),
            StoryElement(string: "Let's start with the first question!", responses: [ ButtonFields(text: "Let's Go!", backgroundColor: "SecondaryColor", textColor: "TextColor")])
        ]
    }
    
    private func initQuestionsAndResponses(){
        questionsAndResponses = [
            StoryElement(string: "Do you think you are good?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Do you like to be special for someone else?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Do you love?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Do you hate?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Do you want to grow up?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Do you want to be child for ever?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Have you ever asked for an hand to finish some of your tasks?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Do you have any regrets about your past?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "Do you like pizza?", responses: [
                ButtonFields(text: "No", backgroundColor: "SecondaryColor", textColor: "TextColor"),
                ButtonFields(text: "Yes", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ])
        ]
    }
    
    
    private func initEndingAndResponses(){
        endingAndResponses = [
            StoryElement(string: "And that's it, We ended our first story, we enjoyed moments and feelings, we answered to ourselves, but we lied ... Actually I lied!", responses: [
                ButtonFields(text: "What?", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ]),
            StoryElement(string: "I told you that the purpose of that was to discover if you are a good or bad person, it was not true. The purpose of this was to see into yourself, and explore and discover things that maybe you forgot, you saw you.", responses: [
                ButtonFields(text: "SeeMe", backgroundColor: "SecondaryColor", textColor: "TextColor")
            ])
        ]
    }
    
    
    public func getDialogsAndResponses() -> [StoryElement]{
        return dialogsAndResponses
    }
    
    public func getEndingAndResponses() -> [StoryElement]{
        return endingAndResponses
    }
    public func getQuestionsAndResponses() -> [StoryElement]{
        return questionsAndResponses
    }
    public func getAllOrdered() -> [StoryElement] {
        var allStories : [StoryElement] = []
        for dialog in dialogsAndResponses {
            allStories.append(dialog)
        }
        for question in questionsAndResponses {
            allStories.append(question)
        }
        for ending in endingAndResponses{
            allStories.append(ending)
        }
        return allStories
    }
    
    
}


