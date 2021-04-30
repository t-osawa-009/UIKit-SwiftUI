import SwiftUI

struct BackButtonView: View {
    let relay = Relay<Void>()
    var body: some View {
        Button(action: {
            relay.call(())
        }, label: {
            Text("Back")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }).background(Color.blue)
        .cornerRadius(9)
    }
}

struct SampleButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}

