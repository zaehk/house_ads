struct IDResultMultimediaImageDTO: Codable
{
    let url: String?
    
    init(url: String){
        self.url = url
    }
}
