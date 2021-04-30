import SwiftUI
import Combine

struct ThumbnailView: View {
    @State var image: UIImage
    init(image: UIImage) {
        self.image = image
    }
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(image: .init(named: "150x150")!)
    }
}
