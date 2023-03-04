//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Silvanei  Martins on 03/03/23.
//

import UIKit

///Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Total Paginas: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
