//
//  ChannelCell.swift
//  youtube-clone
//
//  Created by pop on 3/22/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var roundPic: RoundButton!
    @IBOutlet weak var subscribtionBTN: UIButton!
    
    var channel:ChannelVM!{
        didSet{
            myLabel.text = channel.name
            let url = URL(string: channel.imageurl)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    let img = UIImage(data: data!)
                    self.myImage.image = img
                    self.roundPic.setBackgroundImage(img, for: .normal)
                    self.roundPic.clipsToBounds = true
                }
            }
        }
    }

}
