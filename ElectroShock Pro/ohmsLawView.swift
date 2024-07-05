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
    var body: some View {
        Image("home_page")
            .resizable()
            .scaledToFit()
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

