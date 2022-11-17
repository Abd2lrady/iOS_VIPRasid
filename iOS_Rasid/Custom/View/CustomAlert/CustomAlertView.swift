//
//  CustomAlertView.swift
//  iOS_Rasid
//
//  Created by Fintech on 17/11/2022.
//

import UIKit

class CustomAlertView: UIView {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet var titleLabels: [UILabel]!
    
    @IBOutlet var dataTextFields: [UITextField]!
    
    @IBOutlet var textFieldContainerViews: [UIView]!
    
    
    var buttonTappedCallback: (() -> Void)?
    var tapGestureDetected: (() -> Void)?
    let pickerView = UIPickerView()
    let pickerDelegate = PickerViewDelegate(titles: [])

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configUI()
    }
    
    private func commonInit() {
        let nib = Bundle.main.loadNibNamed("\(CustomAlertView.self)", owner: self)
        guard let view = nib?.first as? UIView
        else { fatalError("cant load custom filter alert view") }
        self.addSubview(view)
        pickerView.delegate = pickerDelegate
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     view.rightAnchor.constraint(equalTo: self.rightAnchor),
                                     view.leftAnchor.constraint(equalTo: self.leftAnchor)])
        
    }
    
//    @IBAction func branchNameTapped(_ sender: Any) {
//        pickerField = .branchName
//        dataTextFields[Fields.branchName.rawValue].becomeFirstResponder()
//        pickerDelegate.titles = ["ahmed", "muhammed"]
//        pickerView.reloadAllComponents()
//
//    }
//    @IBAction func managerNameTapped(_ sender: Any) {
//        pickerField = .branchName
//        dataTextFields[Fields.branchName.rawValue].becomeFirstResponder()
//        pickerDelegate.titles = ["sameh", "hagag"]
//        pickerView.reloadAllComponents()
//
//    }
//    @IBAction func fromButtonTapped(_ sender: Any) {
//        pickerField = .branchName
//        dataTextFields[Fields.from.rawValue].becomeFirstResponder()
//        pickerDelegate.titles = ["25/10/2022", "25/11/2022"]
//        pickerView.reloadAllComponents()
//
//    }
//    @IBAction func toButtonTapped(_ sender: Any) {
//        pickerField = .branchName
//        dataTextFields[Fields.to.rawValue].becomeFirstResponder()
//        pickerDelegate.titles = ["25/11/2022", "25/12/2022"]
//        pickerView.reloadAllComponents()
//
//    }
    
    @IBAction func tapGestureDetected(_ sender: Any) {
        tapGestureDetected?()
    }
}

extension CustomAlertView {
    
    private func configUI() {
//        backgroundView.backgroundColor = .black
//        backgroundView.alpha = 0.65
        
        alertView.layer.cornerRadius = 10
        textFieldContainerViews.forEach { view in
            view.layer.cornerRadius = 8
        }
//        titleLabels.forEach { label in
//            label.font = Fonts.Cairo.regular.font(size: 16)
//            label.textColor = Colors.addBranchTitleLabels.color
//        }
//
//        dataTextFields.forEach { textField in
//            textField.font = Fonts.Cairo.regular.font(size: 16)
//            textField.textColor = Colors.addBranchTitleTextFields.color
//            textField.backgroundColor = Colors.addBrnachTextFieldsBG.color
//            textField.layer.cornerRadius = 7
//            textField.borderStyle = .none
//        }
        
        configSearchButton()
        
        configTitleLabelsAndTextFieldPlaceholderStrings()
        
        pickerDelegate.selectedTitle = { selected in
            
            
//            switch self.pickerField {
//            case .branchName:
//                self.dataTextFields[Fields.branchName.rawValue].text = selected
//                self.dataTextFields[Fields.branchName.rawValue].resignFirstResponder()
//            case .branchManger:
//                self.dataTextFields[Fields.branchManger.rawValue].text = selected
//                self.dataTextFields[Fields.branchManger.rawValue].resignFirstResponder()
//            case .from:
//                self.dataTextFields[Fields.from.rawValue].text = selected
//                self.dataTextFields[Fields.from.rawValue].resignFirstResponder()
//            case .to:
//                self.dataTextFields[Fields.to.rawValue].text = selected
//                self.dataTextFields[Fields.to.rawValue].resignFirstResponder()
//            default:
//                print("error field selected")
//            }
            
        }
    }
    
    private func configSearchButton() {
//        let buttonString = Strings.Branchs.Filter.searchButtonTitle
//        let buttonAtrributes: [NSAttributedString.Key: Any] =
//        [.font: Fonts.Cairo.regular.font(size: 16),
//         .foregroundColor: Colors.addBranchTitleLabel.color.cgColor]
//
//        let buttonAttributedTitle = NSAttributedString(string: buttonString,
//                                                       attributes: buttonAtrributes)
//        searchButton.setAttributedTitle(buttonAttributedTitle,
//                                        for: .normal)
//        searchButton.backgroundColor = Colors.branchsReportButtonBG.color
        searchButton.layer.cornerRadius = 7
        searchButton.addTarget(self,
                               action: #selector(searchButtonAction),
                               for: .touchUpInside)
        
    }
    
    private func configTitleLabelsAndTextFieldPlaceholderStrings() {
//        titleLabels[Fields.branchName.rawValue].text = Strings.Branchs.Filter.branchNameTitle
//        titleLabels[Fields.branchManger.rawValue].text = Strings.Branchs.Filter.managerNameTitle
//        titleLabels[Fields.from.rawValue].text = Strings.Branchs.Filter.from
//        titleLabels[Fields.to.rawValue].text = Strings.Branchs.Filter.to
//
//        dataTextFields[Fields.branchName.rawValue].placeholder = Strings.Branchs.Filter.branchNamePlaceholder
//        dataTextFields[Fields.branchManger.rawValue].placeholder = Strings.Branchs.Filter.managerNamePlaceholder
//        dataTextFields[Fields.from.rawValue].placeholder = Strings.Branchs.Filter.fromPlaceholder
//        dataTextFields[Fields.to.rawValue].placeholder = Strings.Branchs.Filter.toPlaceholder
        
        dataTextFields[Fields.branchManger.rawValue].inputView = pickerView
        dataTextFields[Fields.branchName.rawValue].inputView = pickerView
        dataTextFields[Fields.from.rawValue].inputView = pickerView
        dataTextFields[Fields.to.rawValue].inputView = pickerView
    }
    
    @objc
    func searchButtonAction() {
        print("buttonTapped")
        buttonTappedCallback?()
        self.removeFromSuperview()
    }

    private enum Fields: Int {
        case branchName
        case branchManger
        case from
        case to
    }
}