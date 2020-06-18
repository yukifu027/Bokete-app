//
//  ViewController.swift
//  Swift5Bokete1
//
//  Created by 福井祐希 on 2020/05/14.
//  Copyright © 2020 Yuki Fukui. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var odaiImageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var searchTextField: UITextField!
    var count = 0
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        commentTextView.layer.cornerRadius = 20.0
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
                case .authorized: break
                case .denied: break
                case .notDetermined: break
                case .restricted: break
            }
        }
        getImages(keyword: "funny")
        
    }
    
//    画像のURLを取得する
    func getImages(keyword: String){
        
        let url = "https://pixabay.com/api/?key=16469782-fa35fa9fe9ec750e190427cce&q=\(keyword)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            case .success:
                let json:JSON = JSON(response.data as Any)
                var imageString = json["hits"][self.count]["webformatURL"].string
                
                if imageString == nil{

                    imageString = json["hits"][0]["webformatURL"].string
                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)

                }else{

                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                    
                }
                
                
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    
//次の画像を表示させるボタン
    @IBAction func nextOdai(_ sender: Any) {
        
        count = count + 1
        if searchTextField.text == ""{
            getImages(keyword: "funny")
        }else{
            getImages(keyword: searchTextField.text!)
        }
        
        
        
    }
    
    
// キーワードをもとに検索する
    @IBAction func searchAction(_ sender: Any) {
        
        self.count = 0
        if searchTextField.text == ""{
            getImages(keyword: "funny")
        }else{
            getImages(keyword: searchTextField.text!)
        }
        
    }
    
//シェアするための決定ボタン
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let shareVC = segue.destination as! ShareViewController
        shareVC.commentString = commentTextView.text
        shareVC.resultImage = odaiImageView.image!
        
    }
    
    

    
    


}

