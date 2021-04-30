import SwiftUI

struct SampleListView: View {
    private var maxCount = Int.random(in: 30...100)
    let relay = Relay<Int>()
    var body: some View {
        List(0..<maxCount) {(row: Int) in
            Button(action: {
                relay.call(row)
            }, label: {
                Text("Row \(row)")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            })
        }
    }
}

struct SampleListView_Previews: PreviewProvider {
    static var previews: some View {
        SampleListView()
    }
}
