//
//  ViewController.swift
//  youtube-clone
//
//  Created by pop on 3/22/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import Pods_youtube_clone
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var Testimage: UIImageView!
    
    let url = "https://www.googleapis.com/youtube/v3/channels"
    let url2 = "https://www.googleapis.com/youtube/v3/subscriptions"
    let videoChannel = "https://www.googleapis.com/youtube/v3/videos"
    let api = "AIzaSyB43vfEpUD3NFH5ZV3l1UXcJOZ5aZ7SIZQ"
    
    @IBOutlet weak var YTBviewplayer:YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.YTBviewplayer.load(withVideoId: "4VEMLNg3ICo")
       // loadChannel()
    }

 
    @IBAction func stopBTN(_ sender: UIButton) {
        print("stop pressed")
        self.YTBviewplayer.stopVideo()
    }
    
    @IBAction func playBTN(_ sender: UIButton) {
        print("play pressed")
        self.YTBviewplayer.playVideo()
    }
    
    // id : egyking7  UCuP2vJ6kRutQBfRmdcI92mA
    func loadChannel(){
        print("start  func")
        let resourceId = ["kind":"youtube#channel", "channelId": "UCuP2vJ6kRutQBfRmdcI92mA"]
        let parms : [String:Any] = ["snippet":resourceId]
        let parameter = ["part":"snippet","id":"user/egyking7","key":api]
        Alamofire.request(videoChannel, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil) .responseJSON { (response) in
            if response.result.isSuccess{
                let jsonData:JSON = JSON(response.result.value)
                    print("json is -> \(jsonData)")
//                let etag = jsonData["etag"].string ?? "no"
//                 print("etag is -> \(etag)")
               // self.getimage( test:etag)
//                guard let arr = jsonData["items"].array else{print("error to be array");
//                    return }
//
//                for item in arr{
//                    let obj = item.dictionary
//                    let url = obj!["snippet"]!["thumbnails"]["default"]["url"].string ?? "no"
//                    print("url is \(url)")
//                    self.getimage(test: url)
//                    var title = obj!["snippet"]!["title"].string ?? "no"
//                    print("title is \(title)")
//                }
            }
        }
    }
    
    
    func getimage( test:String){
        
            let url = URL(string: test)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.Testimage.image = UIImage(data: data!)
             }
           }
        }

}






