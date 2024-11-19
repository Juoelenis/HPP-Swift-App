import SwiftUI

struct ContentView: View {
    @State private var showLoading = false
    @State private var progress = 0.0
    
    let retroBackgroundColor = Color(red: 0.15, green: 0.15, blue: 0.15) // Dark retro background color
    let accentColor = Color.green // You could use neon green for retro vibes
    
    var body: some View {
        VStack {
            Text("Hpa Progress Plexus")
                .font(.largeTitle)
                .foregroundColor(accentColor)
                .padding(.top, 50)
            
            Spacer()
            
            Text("An Old Interweb Revival")
                .font(.title3)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            // Display a progress bar
            ProgressView(value: progress, total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: accentColor))
                .padding()
                .frame(width: 300)
            
            if showLoading {
                Text("Loading...")
                    .foregroundColor(.white)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                startProgress()
            }) {
                Text("Start Reviving the Web!")
                    .font(.title2)
                    .padding()
                    .background(accentColor)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .background(retroBackgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    func startProgress() {
        showLoading = true
        progress = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                showLoading = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
