//
//  DelegatePracticeVC.swift
//  Seminar3
//
//  Created by 황지은 on 2021/10/23.
//

import UIKit

class DelegatePracticeVC: UIViewController {
    
    @IBOutlet var topTextField: UITextField! {
        didSet {
            topTextField.text = "iOS"
        }
    }
    @IBOutlet var partImageView: UIImageView! {
        didSet {
            partImageView.image = UIImage(named: "wesoptiOSPart")
        }
    }
    @IBOutlet var partPickerView: UIPickerView!
    
    var partList: [PartData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topTextField.delegate = self
        partPickerView.delegate = self
        initPartData()
    }
    
    func initPartData() {
        partList.append(contentsOf: [
            PartData(imageName: "wesoptiOSPart", partName: "iOS"),
            PartData(imageName: "wesoptAndroidPart", partName: "Android"),
            PartData(imageName: "wesoptWebPart", partName: "Web"),
            PartData(imageName: "wesoptServerPart", partName: "Server"),
            PartData(imageName: "wesoptDesignPart", partName: "Design"),
            PartData(imageName: "wesoptPlanPart", partName: "Plan")
        ])
    }
}
//MARK: - UITextFieldDelegate
extension DelegatePracticeVC: UITextFieldDelegate {
    // 텍스트 필드를 터치하고 편집이 시작될 때 실행되는 메소드
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    // 텍스트필드의 편집을 끝낼 때 실행되는 메소드
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    // 텍스트 필드 편집 중 키보드에서 'return'키를 눌렀을 때 실행되는 메소드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        // 텍스트 필드의 편집을 끝내주는 메소드
        textField.endEditing(true)
        return true
    }
}
//MARK: - UIPickerViewDataSource
extension DelegatePracticeVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partList[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        partImageView.image = partList[row].makeImage()
        topTextField.text = partList[row].partName
    }
}
//MARK: - UIPickerViewDelegate
extension DelegatePracticeVC: UIPickerViewDelegate {
    
}
