//
//  BranchCell.swift
//  iOS_Rasid
//
//  Created by Fintech on 07/11/2022.
//

import UIKit

class BranchCell: UITableViewCell {
    static let reuseID = "BranchCell"
    
    var viewDetailsTapped: ((Int?) -> Void)?
    var cellIndex: Int?
    @IBOutlet weak var branchNameLabel: UILabel!
    @IBOutlet weak var managerNameLabel: UILabel!
    @IBOutlet weak var sellersCountLabel: UILabel!
    @IBOutlet weak var showBranchDetailsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCellUI()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension BranchCell {
    
    func configCell(with branch: Branch.ViewModel, at index: Int) {
        branchNameLabel.text = branch.branchName
        managerNameLabel.text = branch.managerName
        sellersCountLabel.text = branch.sellersCount
        cellIndex = index
    }
    
    func clearCell() {
        branchNameLabel.text = ""
        managerNameLabel.text = ""
        sellersCountLabel.text = ""
        cellIndex = nil
    }
    
    func configCellUI() {
        branchNameLabel.font = Fonts.Cairo.regular.font(size: 12)
        branchNameLabel.textColor = Colors.branchCellBranchName.color
        
        managerNameLabel.font = Fonts.Cairo.regular.font(size: 16)
        managerNameLabel.textColor = Colors.branchCellManagerName.color
        
        sellersCountLabel.font = Fonts.Cairo.regular.font(size: 16)
        sellersCountLabel.textColor = Colors.branchCellSellersCount.color
        
        showBranchDetailsButton.setImage(Images.showBranchDetailsButtonIc.image,
                                         for: .normal)
        showBranchDetailsButton.addTarget(self, action: #selector(showDetailsButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func showDetailsButtonTapped() {
        viewDetailsTapped?(cellIndex)
    }
}
