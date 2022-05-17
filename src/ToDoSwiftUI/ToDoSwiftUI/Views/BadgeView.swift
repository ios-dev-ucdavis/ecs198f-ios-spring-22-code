import SwiftUI

struct BadgeView: View {
    var content: String?
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.secondarySystemBackground)
            
            Text(content ?? "0")
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
            .frame(width: 45, height: 45)
    }
}
