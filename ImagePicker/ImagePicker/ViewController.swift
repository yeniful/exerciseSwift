//
//  ViewController.swift
//  ImagePicker
//
//  Created by Yeni Hwang on 2021/06/17.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self  // ViewController가 picker의 delegate 역할을 할거야
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton){
        self.present(self.imagePicker, animated: true, completion: nil) // imagePicker를 모달로 올려준다.
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        // imagePicker 취소시 그냥 모달을 내려주기
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // didFinishPickingMediaWithInfo info는 딕셔너리 타입으로 받아오는데, 상황에 따라 사용해야하는 키들은 문서에 나와있음
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil) // 모달 내려주기
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

