import SwiftUI

// Background color setup to fill entire safe area, specifically renamed to avoid conflicts
struct RigidBackgroundColorView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
    }
}

// Image displayed below the AppBar, further simplified without any interactive elements
struct RigidHomePageImage: View {
    var body: some View {
        Image("home_page")
            .resizable()
            .scaledToFit()
    }
}

// OhmsLawView using the simplified NewHomePageImage
struct NewRigidView: View {
    var body: some View {
        ZStack {
            RigidBackgroundColorView()
            RigidHomePageImage()
        }
    }
}

// Preview for OhmsLawView
struct NewRigidView_Previews: PreviewProvider {
    static var previews: some View {
        NewRigidView()
    }
}

