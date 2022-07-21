//
//  Model.swift
//  APOD
//
//  Created by David Molina on 3/02/22.
//

import Foundation

struct Apod: Decodable {
  let title: String?
  let url: String?
  let date: String?
  let copyright: String?
  let explanation: String?
}
