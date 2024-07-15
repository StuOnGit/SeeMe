//
//  AppearingText.swift
//  SeeMe
//
//  Created by Francesco De Stasio on 05/04/23.
//

import SwiftUI
import AVFoundation

struct AppearingText: View {
    

    let story : IStory
    let typingSoundFile = "typingSound"
    @Binding var showCameraView  : Bool
    
    @State private var timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    @State private var index = 0
    @State private var textToShow = ""
    @State private var isButtonEnabled = false
    @State private var audioPlayer : AVAudioPlayer?
    
    var body: some View {
        VStack{
            Avatar()
            HStack{
                Spacer()
                ScrollViewReader { scrollView in

                    ScrollView(.vertical){
                        
                            Text(textToShow)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.white)
                                .font(MyFont.loadFont(size: ContentView.fontSizerForDevice(), name: "Grenze-Regular"))
                                .multilineTextAlignment(.leading)
                                .padding()
                                .onReceive(timer) { _ in
                                    let text = story.getAllOrdered()[index].string
                                    
                                    let textIndex = textToShow.index(textToShow.startIndex, offsetBy: textToShow.count)
                             
                                    if(textIndex < text.endIndex){
                                        textToShow += String(text[textIndex])
                                        withAnimation {
                                            scrollView.scrollTo(1, anchor: .center)
                                        }
                                    }else{
                                        stopTypingSound()
                                        timer.upstream.connect().cancel()
                                        DispatchQueue.main.async {
                                            isButtonEnabled = true
                                        }

                                    }
                                }
                                .onAppear{
                                    playTypingSound()
                                }
                                Text("")
                                    .id(1)
                                
                        
                          
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                   
                }
                .padding(.bottom, 30)
                
                Spacer()
            }
            if(isButtonEnabled){
                let numButtons = story.getAllOrdered()[index].responses.count
                HStack(spacing: 50.0){
                    ForEach(0..<numButtons){ i in
                        let buttonFields = story.getAllOrdered()[index].responses[i]
                        
                        Button(action: nextText, label: {
                            Text(buttonFields.text)
                                .foregroundColor(Color(buttonFields.textColor))
                                .frame(width: UIScreen.main.bounds.size.width * 0.3)
                                .font(MyFont.loadFont(size: ContentView.fontSizerForDevice(), name: "Grenze-Bold"))
                        })
                        .padding()
                        .background(.cyan)
                        .cornerRadius(10)
                        .disabled(!isButtonEnabled)
                    }
                }.padding()
            }
            Spacer()
        }
        .padding(.top, 100)
        
    }
    
    private func stopTypingSound(){
        audioPlayer?.stop()
    }
    
    private func playTypingSound(){
        guard let soundURL = Bundle.main.url(forResource: typingSoundFile, withExtension: ".mp3") else {return}
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.volume = 7
            audioPlayer?.prepareToPlay()
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Error typing sound")
        }
    }
    private func nextText() {
        if(index + 1 == story.getAllOrdered().count){
            seeMe()
        }else{
            playTypingSound()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                index = (index + 1) % story.getAllOrdered().count
                textToShow = ""
                isButtonEnabled = false
                self.timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
            }
        }
    }
    
    private func requestCameraPermission(completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    private func seeMe(){
        withAnimation {
            requestCameraPermission { result in
                if(result){
                    self.showCameraView = true
                }
                
            }
        }
    }
    
}



struct AppearingText_Previews: PreviewProvider {
    static var previews: some View {
        AppearingText(story: FirstStory.shared, showCameraView: .constant(false))
    }
}
