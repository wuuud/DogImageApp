//
//  ViewController.swift
//  DogImageApp
//
//  Created by H M on 2022/10/30.
//

import UIKit
import Alamofire
import Kingfisher



class ViewController: UIViewController {
    @IBOutlet weak var dogImageView: UIImageView!
    @IBAction func reloadDogs(_ sender: Any) {
        print("reloadボタンの確認")
        showPhotoFromDogApi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPhotoFromDogApi()
    }
    
    //AlamofireのHTTP通信でリクエスト、データが戻ってくれば受け取って処理
    func showPhotoFromDogApi() {
        AF.request(
            Constants.shared.baseUrlStr  //Constantsファイルに記載
        ).responseDecodable(of: DogApiResponse.self) { response in  //DogApiResponseファイルに記載
            //返ってきたレスポンス(response)をswitch文で場合分けして処理 JSON形式を任意のデータ型に変換
            switch response.result {
            case .success(let value):
                let resultUrl = URL(string: value.message!)!
                self.dogImageView.kf.setImage(with: resultUrl)
            case .failure(let error): 
                print(error.localizedDescription)
            }
        }
    }
}
