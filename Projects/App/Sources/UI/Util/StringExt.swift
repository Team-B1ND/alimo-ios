public extension StringProtocol {
    
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    func getOrNil(idx: Int) -> String? {
        let strLength = self.count
        guard strLength > idx else {
            return nil
        }
        let endIndex = self.index(self.startIndex, offsetBy: idx)
        let substring = self[endIndex...endIndex]
        return String(substring)
    }
}
