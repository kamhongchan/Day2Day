//
//	Field.swift
//
//	Create by Kam Hong Chan on 19/6/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Field : Codable {

	let id : String?
	let type : String?


	enum CodingKeys: String, CodingKey {
		case id = "id"
		case type = "type"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}


}