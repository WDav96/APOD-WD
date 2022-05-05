//
//  Model.swift
//  APOD
//
//  reated by W.D. on 3/02/22.
//

import Foundation

struct Apod: Decodable {
  let title: String?
  let url: String?
  let date: String?
  let copyright: String?
  let explanation: String?
}
