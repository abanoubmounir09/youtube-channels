//
//  ChannelVM.swift
//  youtube-clone
//
//  Created by pop on 3/22/20.
//  Copyright © 2020 pop. All rights reserved.
//

import Foundation

struct ChannelVM{
    var name :String
    var imageurl:String
    var id : String
    
    init(chanob:Channel){
        self.name = chanob.name
        self.imageurl = chanob.imageurl
        self.id = chanob.id
    }
}
