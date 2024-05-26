import SwiftUI

// Main ContentView that orchestrates the layout
struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColorView()
                ContentStack()
            }
            .navigationBarHidden(true)
        }
    }
}

// Background color setup to fill entire safe area
struct BackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// VStack that holds the app's main content
struct ContentStack: View {
    var body: some View {
        VStack {
            AppBarView()
                .background(Color.black)
                .edgesIgnoringSafeArea(.top)
            HomePageImage()
            Spacer()
        }
    }
}

// Custom AppBar at the top of the app
struct AppBarView: View {
    var body: some View {
        VStack {
            AppBarContent()
                .padding(.top, 35)
                .padding(.horizontal)
        }
        .background(Color.black)
    }
}

// Content within the AppBar
struct AppBarContent: View {
    var body: some View {
        HStack {
            MenuButton()
            Spacer() // This spacer will push the AppBarTitle to the center
            AppBarTitle()
            Spacer() 
            Spacer()// Ensures the title stays centered
        }
    }
}

// Reusable Menu Button component
struct MenuButton: View {
    var body: some View {
        Button(action: {
            // Action for the menu button
        }) {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.white)
                .padding()
        }
    }
}

// Title for the AppBar
struct AppBarTitle: View {
    var body: some View {
        Text("Electro_Shock Pro")
            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            .font(.system(size: 24, weight: .bold))
    }
}

// Image displayed below the AppBar with buttons overlaying it
struct HomePageImage: View {
    var body: some View {
        ZStack {
            Image("home_page")
                .resizable()
                .scaledToFit()
            
            // Overlaying buttons on the image with unique text and navigation
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    ButtonOverlay(text: "Ohms Law", destination: AnyView(OhmsLawView()))
                    ButtonOverlay(text: "Motors", destination: AnyView(MotorsView()))
                }
                HStack(spacing: 10) {
                    ButtonOverlay(text: "Wire", destination: AnyView(WireView()))
                    ButtonOverlay(text: "EMT", destination: AnyView(EMTView()))
                }
                HStack(spacing: 10) {
                    ButtonOverlay(text: "Rigid", destination: AnyView(RigidView()))
                    ButtonOverlay(text: "XFMR", destination: AnyView(XFMRView()))
                }
            }
        }
    }
}

struct ButtonOverlay: View {
    var text: String
    var destination: AnyView
    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .foregroundColor(.black)
                .frame(width: 100, height: 50)
                .background(Color.white.opacity(0.7))
                .cornerRadius(20)
                .padding()
        }
    }
}

// Define each destination view for the buttons
struct OhmsLawView: View { var body: some View { Text("Details about Ohms Law") } }
struct MotorsView: View { var body: some View { Text("Details about Motors") } }
struct WireView: View { var body: some View { Text("Details about Wire") } }
struct EMTView: View { var body: some View { Text("Details about EMT") } }
struct RigidView: View { var body: some View { Text("Details about Rigid") } }
struct XFMRView: View { var body: some View { Text("Details about XFMR") } }

// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








