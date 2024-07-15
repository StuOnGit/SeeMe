import SwiftUI



struct ContentView: View {
    @State private var topColor: Color = .red
    @State private var bottomColor: Color = .blue
    @State var showCameraView = false
    @State var showEndingView = false
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            if showCameraView && !showEndingView {
                CameraView(showEndingView: $showEndingView)
            }else if showEndingView{
                EndingView()
            }else{
                VStack{
                    AppearingText(story: FirstStory.shared, showCameraView: $showCameraView)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .opacity(showCameraView ? 0 : 1)
                }
            }
            
        }
        .ignoresSafeArea()
    }
    
    static func fontSizerForDevice() -> CGFloat {
        let screen = UIScreen.main.bounds
        let screenHeight = screen.height
        let screenWidth = screen.width
        
        if(UIDevice.current.userInterfaceIdiom == .pad){
            return min(screenHeight, screenWidth) * 0.05
        }else{
            return min(screenHeight, screenWidth) * 0.08
        }
    }
}
