import SwiftUI

// Main ContentView that orchestrates the layout for MotorsView
struct MotorsView: View {
    @State private var motorType: Int?
    @State private var motorParameters: String = ""
    @State private var calculationResult: String = ""

    // Assuming 'motorCalcMap' is accessible as a constant dictionary
    let motorMap = [
        motorCalcMap
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                MotorsBackgroundColorView()
                MotorsContentStack(motorType: $motorType, motorParameters: $motorParameters, calculationResult: $calculationResult, motorCalcMap: motorCalcMap)
            }
            .navigationBarHidden(true)
        }
    }
}

// Background color setup to fill entire safe area for MotorsView
struct MotorsBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// VStack that holds the app's main content for MotorsView
struct MotorsContentStack: View {
    @Binding var motorType: Int?
    @Binding var motorParameters: String
    @Binding var calculationResult: String
    let motorCalcMap: [String: String]

    var body: some View {
        VStack {
            MotorsAppBarView()
                .background(Color.black)
                .edgesIgnoringSafeArea(.top)
            MotorsHomePageImage(motorType: $motorType, motorParameters: $motorParameters, calculationResult: $calculationResult, motorCalcMap: motorCalcMap)
            Spacer()
        }
    }
}

// Custom AppBar at the top of the app for MotorsView
struct MotorsAppBarView: View {
    var body: some View {
        VStack {
            MotorsAppBarContent()
                .padding(.top, 35)
                .padding(.horizontal)
        }
        .background(Color.black)
    }
}

// Content within the AppBar for MotorsView
struct MotorsAppBarContent: View {
    var body: some View {
        HStack {
            MotorsMenuButton()
            Spacer()
            MotorsAppBarTitle()
            Spacer()
            Spacer()
        }
    }
}

// Reusable Menu Button component for MotorsView
struct MotorsMenuButton: View {
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

// Title for the AppBar in MotorsView
struct MotorsAppBarTitle: View {
    var body: some View {
        Text("Motor Calculations")
            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            .font(.system(size: 24, weight: .bold))
    }
}

// Image displayed below the AppBar with buttons overlaying it for MotorsView
struct MotorsHomePageImage: View {
    @Binding var motorType: Int?
    @Binding var motorParameters: String
    @Binding var calculationResult: String
    let motorCalcMap: [String: String]

    let motorOptions = [
        ("AC single phase, 115V", 1),
        ("AC single phase, 208V", 2),
        ("AC single phase, 230V", 3),
        ("AC three phase, 208V", 4),
        ("AC three phase, 230V", 5),
        ("AC three phase, 460V", 6)
    ]

    var body: some View {
        ZStack {
            Image("home_page")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(motorOptions, id: \.1) { option in
                    Button(option.0) {
                        selectMotorType(option.1)
                    }
                    .buttonStyle(MotorButtonStyle())
                }

                TextField("Enter Horse Power: 1.25, 1.5, 2, 3.25", text: $motorParameters)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    performMotorCalculations()
                }) {
                    Text("Calculate Parameters")
                }
                .buttonStyle(MotorButtonStyle())

                Text(calculationResult)
                    .font(.system(size: 34))
                    .foregroundColor(Color.green)
                    .padding()

                Spacer()
            }
            .padding()
        }
    }
    
    func selectMotorType(_ type: Int) {
        motorType = type
    }
    
    func performMotorCalculations() {
        guard let type = motorType, !motorParameters.isEmpty else {
            calculationResult = "Please select a motor type and enter parameters."
            return
        }
        let key = "\(type)\(motorParameters.trimmingCharacters(in: .whitespaces))"
        calculationResult = motorCalcMap[key] ?? "No data available for selected motor type."
    }
}

// Define a custom button style to apply to each button
struct MotorButtonStyle: ButtonStyle {
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

// Preview for MotorsView
struct MotorsView_Previews: PreviewProvider {
    static var previews: some View {
        MotorsView()
    }
}

