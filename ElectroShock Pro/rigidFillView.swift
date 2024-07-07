import SwiftUI
import Combine

// Background color setup to fill entire safe area, specifically renamed to avoid conflicts
struct RigidBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Custom button style to apply to each button
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
    
    func selectConduitType(_ type: Int) {
        conduitType = type
        calculateConduitFill()
    }
    
    func calculateConduitFill() {
        if let type = conduitType, !conduitSize.isEmpty {
            let key = "\(type)\(conduitSize.trimmingCharacters(in: .whitespaces))"
            displayMessage = rigidFillMap[key] ?? "No data available for selected size and type."
        } else {
            displayMessage = "Please enter all fields"
        }
    }

    var body: some View {
        ZStack {
            Image("home_page")
                .resizable()
                .scaledToFit()
            
            VStack {
                ForEach(conduitOptions.indices, id: \.self) { index in
                    if index % 2 == 0 || index == 0 {
                        HStack {
                            if index < conduitOptions.count {
                                Button(conduitOptions[index].0) {
                                    selectConduitType(conduitOptions[index].1)
                                }
                                .buttonStyle(RigidButtonStyle())
                            }
                            if index + 1 < conduitOptions.count {
                                Button(conduitOptions[index + 1].0) {
                                    selectConduitType(conduitOptions[index + 1].1)
                                }
                                .buttonStyle(RigidButtonStyle())
                            }
                        }
                    }
                }
                Spacer()
                TextField("Enter wire size FIRST: 10, 12, 2/0, 4/0, 250, 600", text: $conduitSize)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onReceive(Just(conduitSize)) { newValue in
                        if newValue.isEmpty {
                            displayMessage = "" // Clear message when text field is empty
                        }
                    }
                    .padding()


                Button("Clear") {
                    conduitSize = ""
                    displayMessage = "" // Also clear the display message when the button is pressed
                }
                .buttonStyle(RigidButtonStyle())
                .padding()

                if !displayMessage.isEmpty {
                    Text(displayMessage)
                        .font(.title)
                        .foregroundColor(Color.green)
                        .padding()
                }
            }
        }
    }
}

// Main ContentView that orchestrates the layout for RigidFill
struct RigidFillView: View {
    @State private var conduitType: Int?
    @State private var conduitSize: String = ""
    @State private var displayMessage: String = ""

    let conduitFillMap: [String: String] = [:] // Ensure this is populated correctly
    
    var body: some View {
        NavigationView {
            ZStack {
                RigidBackgroundColorView()
                RigidHomePageImage(conduitType: $conduitType, conduitSize: $conduitSize, displayMessage: $displayMessage)
            }
            .navigationBarHidden(true)
        }
    }
}

// Preview provider for SwiftUI previews
struct RigidFillView_Previews: PreviewProvider {
    static var previews: some View {
        RigidFillView()
    }
}

