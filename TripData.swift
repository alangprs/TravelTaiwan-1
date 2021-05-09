//對應JSON資料的自定義型別

import Foundation

struct SearchResponse:Codable {
    let XML_Head:XML_Head
}
struct XML_Head:Codable {
    let Infos:Infos
}
struct Infos:Codable {
    let Info:[Info]
}
struct Info:Codable {
    let Name:String
    let Picture1:String? //照片
    let Toldescribe:String //介紹
    let Add:String //地址
    let Tel:String //電話
}
