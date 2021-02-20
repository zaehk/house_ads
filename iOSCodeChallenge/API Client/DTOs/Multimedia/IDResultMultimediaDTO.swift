struct IDResultMultimediaDTO: Codable
{
    let images: [IDResultMultimediaImageDTO]
    
    init(images: [String]){
        self.images = images.map({IDResultMultimediaImageDTO.init(url: $0)})
    }
}
