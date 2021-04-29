//Solution goes in Sources
/*
 Açıklaması:
 Geliş tipi T dersek, verilen fonksiyondan return tipine T diyemeyiz.
 Farklı tipte değer dönebilir. Ona da U diyelim. Her bir eleman U'ya dönüştü.
 En sonra fonksiyonun çıktısı bu U dizisi olacaktır. [U]
 */
extension Array {
    func accumulate<T,U>(_ operation: (T) -> (U)) -> [U] {
        let newArray = self.map { operation($0 as! T) }
        return newArray
    }
}
