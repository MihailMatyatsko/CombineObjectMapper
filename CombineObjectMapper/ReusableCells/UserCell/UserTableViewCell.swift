//
//  UserTableViewCell.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 09.08.2022.
//

import UIKit

final class UserTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userNickNameLabel: UILabel!
    @IBOutlet private weak var userEmailLabel: UILabel!
    @IBOutlet private weak var userStreetLabel: UILabel!
    @IBOutlet private weak var userSuiteLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .black
    }
    
    func setup(with viewModel: UserCellViewModel) {
        userNameLabel.text = viewModel.nickName
        userEmailLabel.text = viewModel.email
        userNickNameLabel.text = viewModel.nickName
        userStreetLabel.text = viewModel.userAdress.street
        userSuiteLable.text = viewModel.userAdress.suite
    }
    
}
