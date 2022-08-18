//
//  PostTableViewCell.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 18.08.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .magenta.withAlphaComponent(0.5)
    }
    
    func setup(with viewModel: PostTableViewModel) {
        self.titleLabel.text = viewModel.title
        self.bodyLabel.text = viewModel.body
    }
    
}
