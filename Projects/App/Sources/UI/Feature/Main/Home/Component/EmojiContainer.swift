import ADS
import SwiftUI

struct EmojiContainer: View {
    
    var selectedEmoji: EmojiType?
    var emojies: [Emoji]
    var onClickEmoji: (EmojiType) -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
//                .foregroundColor(.gray100)
                .frame(width: 300, height: 35)
                .cornerRadius(5, corners: .allCorners)
            
            HStack {
                ForEach(emojies, id: \.self) { emoji in
                    if let emojiType = emoji.emojiType {
                        Button {
                            onClickEmoji(emojiType)
                        } label: {
                            emojiImage(image: emojiType.image, num: emoji.count, isSelected: selectedEmoji == emojiType)
                        }
                    }
                }
            }
        }
    }
    
    func emojiImage(image: Image, num: Int, isSelected: Bool) -> some View {
        HStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:  20, height:  20)
                .cornerRadius(5, corners: .allCorners)
                .padding(2)
                .opacity(isSelected ? 1.0 : 0.5)
            
            Text("\(num)")
                .foregroundColor(.black)
                .opacity(isSelected ? 1.0 : 0.5)
        }
    }
}
