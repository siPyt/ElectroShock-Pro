import SwiftUI

// Main ContentView that orchestrates the layout for ConduitFill
struct ConduitFillView: View {
    @State private var conduitType: Int?
    @State private var conduitSize: String = ""
    @State private var displayMessage: String = ""

    // Assuming 'emtFillMap' is accessible as a constant dictionary
    let conduitFillMap = emtFillMap
    
    var body: some View {
        NavigationView {
            ZStack {
                ConduitBackgroundColorView()
                ConduitContentStack(conduitType: $conduitType, conduitSize: $conduitSize, displayMessage: $displayMessage, conduitFillMap: conduitFillMap)
            }
            .navigationBarHidden(true)
        }
    }
}

// Background color setup to fill entire safe area for ConduitFill
struct ConduitBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// VStack that holds the app's main content for ConduitFill
struct ConduitContentStack: View {
    @Binding var conduitType: Int?
    @Binding var conduitSize: String
    @Binding var displayMessage: String
    let conduitFillMap: [String: String]

    var body: some View {
        VStack {
            ConduitAppBarView()
                .background(Color.black)
                .edgesIgnoringSafeArea(.top)
            ConduitHomePageImage(conduitType: $conduitType, conduitSize: $conduitSize, displayMessage: $displayMessage, conduitFillMap: conduitFillMap)
            Spacer()
        }
    }
}

// Custom AppBar at the top of the app for ConduitFill
struct ConduitAppBarView: View {
    var body: some View {
        VStack {
            ConduitAppBarContent()
                .padding(.top, 35)
                .padding(.horizontal)
        }
        .background(Color.black)
    }
}

// Content within the AppBar for ConduitFill
struct ConduitAppBarContent: View {
    var body: some View {
        HStack {
            ConduitMenuButton()
            Spacer() // This spacer will push the AppBarTitle to the center
            ConduitAppBarTitle()
            Spacer() // Ensures the title stays centered
            Spacer()
        }
    }
}

// Reusable Menu Button component for ConduitFill
struct ConduitMenuButton: View {
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

// Title for the AppBar in ConduitFill
struct ConduitAppBarTitle: View {
    var body: some View {
        Text("Electro_Shock Pro")
            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            .font(.system(size: 24, weight: .bold))
    }
}

// Image displayed below the AppBar with buttons overlaying it for ConduitFill
struct ConduitHomePageImage: View {
    @Binding var conduitType: Int?
    @Binding var conduitSize: String
    @Binding var displayMessage: String
    let conduitFillMap: [String: String]

    let conduitOptions = [
        ("EMT, 1/2\"", 1),
        ("EMT, 3/4\"", 2),
        ("EMT, 1\"", 3),
        ("EMT, 1-1/4\"", 4),
        ("EMT, 1-1/2\"", 5),
        ("EMT, 2\"", 6)
    ]

    var body: some View {
        ZStack {
            Image("home_page")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(conduitOptions, id: \.1) { option in
                    Button(option.0) {
                        selectConduitType(option.1)
                    }
                    .buttonStyle(ConduitButtonStyle())
                }

                TextField("Enter wire size FIRST: 12, 2/0, 4/0, 250", text: $conduitSize)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                HStack {
                    Button(action: {
                        // Action for clear button
                        self.conduitSize = ""
                    }) {
                        Text("Clear")
                            
                    }
                    .buttonStyle(ConduitButtonStyle())
                    
                    Spacer()
                }

                Text(displayMessage)
                    .font(.title)
                    .foregroundColor(Color.green)
                    .padding()
                
                Spacer()
            }
            .padding()
        }
    }
    
    func selectConduitType(_ type: Int) {
        conduitType = type
        calculateConduitFill()
    }
    
    func calculateConduitFill() {
        if let type = conduitType, !conduitSize.isEmpty {
            let key = "\(type)\(conduitSize.trimmingCharacters(in: .whitespaces))"
            displayMessage = conduitFillMap[key] ?? "No data available for selected size and type."
        } else {
            displayMessage = "Please enter all fields"
        }
    }
}

// Define a custom button style to apply to each button
struct ConduitButtonStyle: ButtonStyle {
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

// Preview for ConduitFillView
struct ConduitFillView_Previews: PreviewProvider {
    static var previews: some View {
        ConduitFillView()
    }
}





