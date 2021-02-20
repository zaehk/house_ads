struct IDResultDTO: Codable
{
    let propertyCode: String?
    let thumbnail: String?
    let price: Int?
    let propertyType: String?
    let operation: String?
    let multimedia: IDResultMultimediaDTO?
    let detailUrl: String?
    
    init(id: String?, thumbnail: String?, price: Int?, propertyType: String?, operation: String?, multimedia: [String], detailURL: String?){
        self .propertyCode = id
        self.thumbnail = thumbnail
        self.price = price
        self.propertyType = propertyType
        self.operation = operation
        self.multimedia = IDResultMultimediaDTO.init(images: multimedia)
        self.detailUrl = detailURL
    }
    
}
