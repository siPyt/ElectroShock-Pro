import SwiftUI

// Background color setup to fill entire safe area, specifically renamed to avoid conflicts
struct RigidBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image displayed below the AppBar, now using custom button styles
struct RigidHomePageImage: View {
    @Binding var conduitType: Int?
    @Binding var conduitSize: String
    @Binding var displayMessage: String
    
    let conduitOptions = [
        ("Rigid, 1/2\"", 1),
        ("Rigid, 3/4\"", 2),
        ("Rigid, 1\"", 3),
        ("Rigid, 1-1/4\"", 4),
        ("Rigid, 1-1/2\"", 5),
        ("Rigid, 2\"", 6),
        ("Rigid, 2-1/2\"", 7),
        ("Rigid, 3\"", 8),
        ("Rigid, 3-1/2\"", 9),
        ("Rigid, 4\"", 10)
    ]

    var body: some View {
        ZStack {
            Image("home_page")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(conduitOptions, id: \.1) { option in
                    Button(option.0) {
                        self.conduitType = option.1
                    }
                    .buttonStyle(ConduitButtonStyle())
                }

                TextField("Enter wire size FIRST", text: $conduitSize)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Text(displayMessage)
                    .font(.title)
                    .foregroundColor(Color.green)
                    .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

// Define a custom button style to apply to each button
struct RigidButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.gray.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .font(.system(size: 20, weight: .bold))
    }
}

// Main ContentView that orchestrates the layout for RigidFill
struct RigidFillView: View {
    @State private var conduitType: Int?
    @State private var conduitSize: String = ""
    @State private var displayMessage: String = ""

    // Assuming 'emtFillMap' is accessible as a constant dictionary
    let conduitFillMap = emtFillMap
    
    var body: some View {
        NavigationView {
            ZStack {
                RigidBackgroundColorView()
                RigidContentStack(conduitType: $conduitType, conduitSize: $conduitSize, displayMessage: $displayMessage, conduitFillMap: conduitFillMap)
            }
            .navigationBarHidden(true)
        }
    }
}

// VStack that holds the app's main content for RigidFill
struct RigidContentStack: View {
    @Binding var conduitType: Int?
    @Binding var conduitSize: String
    @Binding var displayMessage: String
    let conduitFillMap: [String: String]

    var body: some View {
        VStack {
            RigidAppBarView()
                .background(Color.black)
                .edgesIgnoringSafeArea(.top)
            RigidHomePageImage(conduitType: $conduitType, conduitSize: $conduitSize, displayMessage: $displayMessage)
            Spacer()
        }
    }
}

// Custom AppBar at the top of the app for RigidFill
struct RigidAppBarView: View {
    var body: some View {
        VStack {
            RigidAppBarContent()
                .padding(.top, 35)
                .padding(.horizontal)
        }
        .background(Color.black)
    }
}

// Content within the AppBar for RigidFill
struct RigidAppBarContent: View {
    var body: some View {
        HStack {
            RigidMenuButton()
            Spacer() // This spacer will push the AppBarTitle to the center
            RigidAppBarTitle()
            Spacer() // Ensures the title stays centered
            Spacer()
        }
    }
}

// Reusable Menu Button component for RigidFill
struct RigidMenuButton: View {
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

// Title for the AppBar in RigidFill
struct RigidAppBarTitle: View {
    var body: some View {
        Text("Electro_Shock Pro")
            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            .font(.system(size: 24, weight: .bold))
    }
}

// Preview for RigidFillView
struct RigidFillView_Previews: PreviewProvider {
    static var previews: some View {
        RigidFillView()
    }
}



