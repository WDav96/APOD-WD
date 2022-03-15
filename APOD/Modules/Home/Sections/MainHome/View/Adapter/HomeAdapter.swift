//
//  MainAdapter.swift
//  APOD
//
//  Created by W.D. on 4/03/22.
//

import UIKit

protocol HomeAdapterDelegate {
    func didSelectRowAt(apod: Apod, image: UIImage?)
}

class HomeAdapter: NSObject {
    
    // MARK: - Internal Properties
    
    var apodList: [Apod] = []
    
    var delegate: HomeAdapterDelegate?
}

// MARK: - UITableViewDataSource
extension HomeAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomTableViewCell.self), for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let apod = apodList[indexPath.row]
        cell.apod = apod
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
            delegate?.didSelectRowAt(apod: apodList[indexPath.row], image: cell.image)
        }
    }
}
