import SwiftUI
import ADS

public struct SeparatedTextField: View {
    
    // MARK: - parameters
    @Binding var text: String
    let length: Int
    
    public init(
        text: Binding<String>,
        length: Int
    ) {
        self._text = text
        self.length = length
    }
    
    // MARK: - local state
    @FocusState private var isFocused: Bool
    
    // MARK: - View
    public var body: some View {
        ZStack {
            TextField("", text: $text)
                .labelsHidden()
                .textFieldStyle(RealTextFieldStyle(isFocused: isFocused))
                .focused($isFocused)
            HStack {
                ForEach(0..<length, id: \.self) { idx in
                    let char = text.getOrNil(idx: idx) ?? ""
                    RealCodeCell(isFocused: text.count > idx, char: char)
                }
            }
        }
        .onChange(of: text) {
            if $0.count > length {
                text = text[0..<length]
            }
        }
    }
}

struct RealTextFieldStyle: TextFieldStyle {
    
    @Environment(\.isEnabled) var isEnabled
    var isFocused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        configuration
            .autocorrectionDisabled()
            .keyboardType(.asciiCapable)
            .textInputAutocapitalization(.never)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(.clear)
            .padding(.horizontal, 16)
            .accentColor(.clear)
            .foregroundStyle(.clear)
    }
}

struct RealCodeCell: View {
    
    @Environment(\.isEnabled) var isEnabled
    var isFocused: Bool
    
    var char: String
    
    var body: some View {
        
        let lineWidth = isFocused ? 1.5 : 1
        let strokeColor: SementicColor = isFocused ? AlimoColor.Color.primary60 : AlimoColor.Label.alt
        
        Text(char)
            .alimoFont(.bodyM)
            .alimoColor(AlimoColor.Label.normal)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .padding(.horizontal, 16)
            .cornerRadius(12, corners: .allCorners)
            .allowsHitTesting(false)
            .overlay(
                ZStack {
                    RoundedCorner(radius: 12)
                        .stroke(lineWidth: lineWidth)
                        .alimoColor(strokeColor)
                }
            )
    }
}
