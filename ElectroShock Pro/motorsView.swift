import SwiftUI

// Background color setup to fill entire safe area, specifically renamed to avoid conflicts
struct MotorsBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image displayed below the AppBar, further simplified without any interactive elements
struct MotorsHomePageImage: View {
    var body: some View {
        Image("home_page")
            .resizable()
            .scaledToFit()
    }
}

// OhmsLawView using the simplified NewHomePageImage
struct NewMotorsView: View {
    var body: some View {
        ZStack {
            MotorsBackgroundColorView()
            MotorsHomePageImage()
        }
    }
}

// Preview for OhmsLawView
struct NewMotorsView_Previews: PreviewProvider {
    static var previews: some View {
        NewMotorsView()
    }
}

