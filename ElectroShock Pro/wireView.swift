import SwiftUI

// Main ContentView that orchestrates the layout for WireView
struct WireView: View {
    @State private var wireType: Int?
    @State private var wireSize: String = ""
    @State private var displayMessage: String = ""

    // Assuming 'wireAmpMap' is accessible as a constant dictionary
    let wireMap = [
        wireAmpMap
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                WireBackgroundColorView()
                WireContentStack(wireType: $wireType, wireSize: $wireSize, displayMessage: $displayMessage, wireAmpMap: wireAmpMap)
            }
            .navigationBarHidden(true)
        }
    }
}

// Background color setup to fill entire safe area for WireView
struct WireBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// VStack that holds the app's main content for WireView
struct WireContentStack: View {
    @Binding var wireType: Int?
    @Binding var wireSize: String
    @Binding var displayMessage: String
    let wireAmpMap: [String: String]

    var body: some View {
        VStack {
            WireAppBarView()
                .background(Color.black)
                .edgesIgnoringSafeArea(.top)
            WireHomePageImage(wireType: $wireType, wireSize: $wireSize, displayMessage: $displayMessage, wireAmpMap: wireAmpMap)
            Spacer()
        }
    }
}

// Custom AppBar at the top of the app for WireView
struct WireAppBarView: View {
    var body: some View {
        VStack {
            WireAppBarContent()
                .padding(.top, 35)
                .padding(.horizontal)
        }
        .background(Color.black)
    }
}

// Content within the AppBar for WireView
struct WireAppBarContent: View {
    var body: some View {
        HStack {
            WireMenuButton()
            Spacer()
            WireAppBarTitle()
            Spacer()
            Spacer()
        }
    }
}

// Reusable Menu Button component for WireView
struct WireMenuButton: View {
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

// Title for the AppBar in WireView
struct WireAppBarTitle: View {
    var body: some View {
        Text("Wire Ampacity Calculator")
            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            .font(.system(size: 24, weight: .bold))
    }
}

// Image displayed below the AppBar with buttons overlaying it for WireView
struct WireHomePageImage: View {
    @Binding var wireType: Int?
    @Binding var wireSize: String
    @Binding var displayMessage: String
    let wireAmpMap: [String: String]

    let wireOptions = [
        ("Copper, 60 degrees", 1),
        ("Copper, 75 degrees", 2),
        ("Copper, 90 degrees", 3),
        ("Aluminum, 60 degrees", 4),
        ("Aluminum, 75 degrees", 5),
        ("Aluminum, 90 degrees", 6)
    ]

    var body: some View {
        ZStack {
            Image("home_page")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(wireOptions, id: \.1) { option in
                    Button(option.0) {
                        selectWireType(option.1)
                    }
                    .buttonStyle(ConduitButtonStyle())
                }

                TextField("Enter wire size: 12, 2/0, 4/0, 250", text: $wireSize)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    calculateWireAmpacity()
                }) {
                    Text("Calculate Ampacity")
                }
                .buttonStyle(ConduitButtonStyle())

                Text(displayMessage)
                    .font(.system(size: 34)) // Changed from .title to .system(size: 34)
                    .foregroundColor(Color.green)
                    .padding()

                
                Spacer()
            }
            .padding()
        }
    }
    
    func selectWireType(_ type: Int) {
        wireType = type
    }
    
    func calculateWireAmpacity() {
        guard let type = wireType, !wireSize.isEmpty else {
            displayMessage = "Please select a wire type and enter a wire size."
            return
        }
        let key = "\(type)\(wireSize.trimmingCharacters(in: .whitespaces))"
        displayMessage = wireAmpMap[key] ?? "No data available for selected size and type."
    }
}

// Define a custom button style to apply to each button
struct WireButtonStyle: ButtonStyle {
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

// Preview for WireView
struct WireView_Previews: PreviewProvider {
    static var previews: some View {
        WireView()
    }
}

