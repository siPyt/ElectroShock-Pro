import SwiftUI

// Background color setup to fill entire safe area for WireView
struct WireBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image displayed below the AppBar with buttons overlaying it for WireView
struct WireHomePageImage: View {
    @Binding var wireType: Int?
    @Binding var wireSize: String
    @Binding var displayMessage: String
    let wireFillMap: [String: String]

    let wireOptions = [
        ("Copper, 60 degrees", 1),
        ("Copper, 75 degrees", 2),
        ("Copper, 90 degrees", 3),
        ("Aluminum, 60 degrees", 4),
        ("Aluminum, 75 degrees", 5),
        ("Aluminum, 90 degrees", 6)
    ]

    var body: some View {
        Image("home_page")  // Assuming you want the same "home_page" image as used in MotorsView
            .resizable()
            .scaledToFit()
            .overlay(
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(wireOptions, id: \.1) { option in
                        Button(option.0) {
                            selectWireType(option.1)
                        }
                        .buttonStyle(ConduitButtonStyle())
                    }

                    TextField("Enter wire size FIRST: 12, 2/0, 4/0, 250", text: $wireSize)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    HStack {
                        Button(action: {
                            // Action for clear button
                            self.wireSize = ""
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
            )
    }

    func selectWireType(_ type: Int) {
        wireType = type
        calculateWireFill()
    }
    
    func calculateWireFill() {
        if let type = wireType, !wireSize.isEmpty {
            let key = "\(type)\(wireSize.trimmingCharacters(in: .whitespaces))"
            displayMessage = wireFillMap[key] ?? "No data available for selected size and type."
        } else {
            displayMessage = "Please enter all fields"
        }
    }
}

// Main view setup using the simplified background and home page image
struct WireView: View {
    var body: some View {
        ZStack {
            WireBackgroundColorView()
            WireHomePageImage(wireType: .constant(nil), wireSize: .constant(""), displayMessage: .constant(""), wireFillMap: [:])
        }
    }
}

// Preview for WireView
struct WireView_Previews: PreviewProvider {
    static var previews: some View {
        WireView()
    }
}

