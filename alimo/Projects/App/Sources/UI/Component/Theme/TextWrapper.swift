import SwiftUI

public struct TextWrapper: UIViewRepresentable {
    var text: String
    var font: UIFont
    var lineSpacing: CGFloat
    var allowTruncating: Bool
    
    public init(
        _ text: String,
        font: UIFont,
        lineSpacing: CGFloat = 6,
        allowTruncating: Bool = false
    ) {
        self.text = text
        self.font = font
        self.lineSpacing = lineSpacing
        self.allowTruncating = allowTruncating
    }
    
    public func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        textView.backgroundColor = .clear
        textView.font = font
        textView.textContainer.lineFragmentPadding = 0
        if allowTruncating {
            textView.textContainer.maximumNumberOfLines = 3
            textView.textContainer.lineBreakMode = .byTruncatingTail
        }
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        textView.textContainerInset = .zero
        return textView
    }
    
    public func updateUIView(_ textView: UITextView, context: Context) {
        textView.text = text
        textView.sizeToFit()
        textView.layoutIfNeeded()
    }
}
