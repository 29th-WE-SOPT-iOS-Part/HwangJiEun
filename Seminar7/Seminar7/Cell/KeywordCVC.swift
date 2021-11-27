//
//  KeywordCVC.swift
//  Seminar7
//
//  Created by 황지은 on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {

    static let identifier = "KeywordCVC"
    @IBOutlet var keywordBtn: UIButton!
    var keyword: String = ""
    var selectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?
    var presentingClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func touchUpToSelect(_ sender: UIButton) {
        if selectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self, unselectedName: keyword)
            keywordBtn.backgroundColor = .clear
        }
        else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordBtn.backgroundColor = .yellow
            presentingClosure?()
        }
        selectedKeyword.toggle()
    }
    
    func setKeyword(text: String) {
        keyword = text
        keywordBtn.setTitle(keyword, for: .normal)
    }

}
