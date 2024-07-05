import SwiftUI

// Background color setup to fill entire safe area, specifically renamed to avoid conflicts
struct NewBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image displayed below the AppBar, further simplified without any interactive elements
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
                
                // Calculated fields
                if let powerVal = Double(power), let resistanceVal = Double(resistance), volts.isEmpty && amps.isEmpty {
                    Text("Volts: \(sqrt(powerVal * resistanceVal))")
                        .foregroundColor(.green)
                        .padding()
                }
                
                if let powerVal = Double(power), let voltsVal = Double(volts), resistance.isEmpty && amps.isEmpty {
                    Text("Resistance: \(powerVal / (voltsVal * voltsVal))")
                        .foregroundColor(.green)
                        .padding()
                }
                
                if let powerVal = Double(power), let ampsVal = Double(amps), resistance.isEmpty && volts.isEmpty {
                    Text("Resistance: \((ampsVal * ampsVal) / powerVal)")
                        .foregroundColor(.green)
                        .padding()
                }
                
                if let resistanceVal = Double(resistance), let voltsVal = Double(volts), power.isEmpty && amps.isEmpty {
                    Text("Power: \(resistanceVal * (voltsVal * voltsVal))")
                        .foregroundColor(.green)
                        .padding()
                }
                
                if let resistanceVal = Double(resistance), let ampsVal = Double(amps), power.isEmpty && volts.isEmpty {
                    Text("Power: \(resistanceVal * (ampsVal * ampsVal))")
                        .foregroundColor(.green)
                        .padding()
                }
                
                if let voltsVal = Double(volts), let ampsVal = Double(amps), power.isEmpty && resistance.isEmpty {
                    Text("Power: \(voltsVal * ampsVal)")
                        .foregroundColor(.green)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

// OhmsLawView using the simplified NewHomePageImage
struct NewOhmsLawView: View {
    var body: some View {
        ZStack {
            NewBackgroundColorView()
            NewHomePageImage()
        }
    }
}

// Preview for OhmsLawView
struct NewOhmsLawView_Previews: PreviewProvider {
    static var previews: some View {
        NewOhmsLawView()
    }
}


