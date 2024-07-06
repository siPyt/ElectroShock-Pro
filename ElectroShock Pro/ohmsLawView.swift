import SwiftUI

// Background color setup to fill the entire safe area, ensuring no naming conflicts
struct NewBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image view modified to include interactive elements for Ohm's Law calculations
struct NewHomePageImage: View {
    @State private var power: String = ""
    @State private var resistance: String = ""
    @State private var volts: String = ""
    @State private var amps: String = ""

    var body: some View {
        ZStack {
            Image("home_page")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 20) {
                TextField("Enter Power", text: $power)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Enter Resistance", text: $resistance)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Enter Volts", text: $volts)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Enter Amps", text: $amps)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                // Display calculations with formatted two decimal places and enlarged font size
                if let powerVal = Double(power), let resistanceVal = Double(resistance), volts.isEmpty && amps.isEmpty {
                    Text("Volts: \(String(format: "%.2f", sqrt(powerVal * resistanceVal)))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                    Text("Amps: \(String(format: "%.2f", sqrt(powerVal / resistanceVal)))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                }
                
                if let powerVal = Double(power), let voltsVal = Double(volts), resistance.isEmpty && amps.isEmpty {
                    Text("Resistance: \(String(format: "%.2f", powerVal / (voltsVal * voltsVal)))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                    Text("Amps: \(String(format: "%.2f", powerVal / voltsVal))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                }
                
                if let voltsVal = Double(volts), let resistanceVal = Double(resistance), power.isEmpty && amps.isEmpty {
                    Text("Power: \(String(format: "%.2f", voltsVal * voltsVal / resistanceVal))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                    Text("Amps: \(String(format: "%.2f", voltsVal / resistanceVal))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                }
                
                if let voltsVal = Double(volts), let ampsVal = Double(amps), power.isEmpty && resistance.isEmpty {
                    Text("Power: \(String(format: "%.2f", voltsVal * ampsVal))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                    Text("Resistance: \(String(format: "%.2f", voltsVal / ampsVal))")
                        .foregroundColor(.green)
                        .font(.system(size: 34)) // Doubled font size
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

// Main view setup using the simplified background and home page image
struct NewOhmsLawView: View {
    var body: some View {
        ZStack {
            NewBackgroundColorView()
            NewHomePageImage()
        }
    }
}

// SwiftUI Preview for NewOhmsLawView
struct NewOhmsLawView_Previews: PreviewProvider {
    static var previews: some View {
        NewOhmsLawView()
    }
}

