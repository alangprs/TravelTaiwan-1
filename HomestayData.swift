//民宿資料

import Foundation
//
struct HomestayResponse:Codable {
    let XML_Head:HomestayXML_Head
}
struct HomestayXML_Head:Codable {
    let Infos:HomestayInfos
}
struct HomestayInfos:Codable {
    let Info:[HomestayInfo]
}
struct HomestayInfo:Codable {
    let Name:String
    let Description:String //介紹
    let Picture1:String? //照片
    let Add:String //地址
    let Tel:String //電話
    let Parkinginfo:String //停車資訊
}
