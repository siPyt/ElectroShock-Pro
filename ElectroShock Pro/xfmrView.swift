import SwiftUI

// Background color setup to fill entire safe area, specifically renamed to avoid conflicts
struct XBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image displayed below the AppBar, further simplified without any interactive elements
struct XHomePageImage: View {
    var body: some View {
        Image("home_page")
            .resizable()
            .scaledToFit()
    }
}

// NewXfmrView using the simplified XHomePageImage
struct NewXfmrView: View {
    var body: some View {
        ZStack {
            XBackgroundColorView()  // Corrected to use XBackgroundColorView
            XHomePageImage()        // Corrected to use XHomePageImage
        }
    }
}

// Preview for NewXfmrView
struct NewXfmrView_Previews: PreviewProvider {
    static var previews: some View {
        NewXfmrView()
    }
}

