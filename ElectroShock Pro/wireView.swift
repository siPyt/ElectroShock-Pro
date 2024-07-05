import SwiftUI

// Background color setup to fill entire safe area, specifically renamed to avoid conflicts
struct WireBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image displayed below the AppBar, further simplified without any interactive elements
struct WireHomePageImage: View {
    var body: some View {
        Image("home_page")
            .resizable()
            .scaledToFit()
    }
}

// OhmsLawView using the simplified NewHomePageImage
struct NewWireView: View {
    var body: some View {
        ZStack {
            WireBackgroundColorView()
            WireHomePageImage()
        }
    }
}

// Preview for OhmsLawView
struct NewWireView_Previews: PreviewProvider {
    static var previews: some View {
        NewWireView()
    }
}

