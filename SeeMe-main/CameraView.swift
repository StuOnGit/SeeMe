//
//  CameraView.swift
//  SeeMe
//
//  Created by Francesco De Stasio on 13/04/23.
//

import SwiftUI
import AVFoundation
import Photos

struct CameraView: View {
    
    @Binding var showEndingView : Bool
    
    
    
    @State private var isShowingImagePicker = true
    @State private var image: UIImage?
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var countDown = 5
    @State private var smileTextIsDisabled = false
    
    
    private let endingText = "Take a screen of this moment!\nHope you had fun!\nBye!"
    private let cheerings = "See you!"
    private let takePicStr = "Take a picture!"
    private let smileStr = "Smile"
    var body: some View {
        VStack {
            ZStack{
                if let image = image {
                    VStack{
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text(endingText)
                            .padding()
                            .font(MyFont.loadFont(size: ContentView.fontSizerForDevice() - 10, name: "Grenze-Bold"))
                            .foregroundColor(.white)
                        
                        Button {
                            seeYou()
                        } label: {
                            Text(cheerings)
                                .foregroundColor(.white)
                                .font(MyFont.loadFont(size: ContentView.fontSizerForDevice(), name: "Grenze-Bold"))
                        }
                        .padding()
                        .foregroundColor(.cyan)
                        .cornerRadius(10)
                        
                    }
                    .padding()
                    
                    
                    
                } else {
                    Button {
                        self.isShowingImagePicker = true
                    } label: {
                        Text(takePicStr)
                            .foregroundColor(.white)
                            .font(MyFont.loadFont(size: ContentView.fontSizerForDevice(), name: "Grenze-Black"))
                    }
                    .padding()
                    .background(.cyan)
                    .cornerRadius(10)
                }
            }
            
            
        }
        .padding()
        .fullScreenCover(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ZStack{
                ImagePicker(image: self.$image, timerValue: $countDown)
                if(!smileTextIsDisabled){
                    Text("\(smileStr)\n\(countDown)")
                        .padding()
                        .font(MyFont.loadFont(size: ContentView.fontSizerForDevice(), name: "Grenze-Black"))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .onReceive(timer) { _ in
                            countDown -= 1
                            if(countDown == 0){
                                self.smileTextIsDisabled = true
                            }
                        }
                }
            }
            .ignoresSafeArea()
        }
        
        
    }
    
    private func seeYou(){
        withAnimation {
            self.showEndingView = true
        }
    }
   
    func loadImage() {
        guard let _ = image else { return }
    }
    
    func resetAllCorrectly(){
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        self.countDown = 3
        self.smileTextIsDisabled = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var image: UIImage?
    @Binding var timerValue : Int
    
    @State private var hasTakenPhoto = false
    var pickerController : UIImagePickerController?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .camera
        imagePicker.cameraDevice = .front

        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if(self.timerValue == 0 && !self.hasTakenPhoto){
                    imagePicker.takePicture()
                    self.hasTakenPhoto = true
                }
            }
        }
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
   
    }
}
