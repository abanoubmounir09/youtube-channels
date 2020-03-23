//
//  channelVC.swift
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

class channelVC: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        loaddata()
    }

    
    func loaddata(){
        helper.loadChannel { (true) in
            self.tableView.reloadData()
        }
        
    }

    
    @IBAction func subscripBTN(_ sender: UIButton) {
        let channelid = helper.channelVMarr[sender.tag].id
         let channelname = helper.channelVMarr[sender.tag].name
        print("name is \(channelname)")
        helper.getsubscribe(IdChannel:channelid)   // need yout api token
        
    }
    
  
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  helper.channelVMarr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChannelCell
        let item = helper.channelVMarr[indexPath.row]
        cell?.channel = item
        cell?.subscribtionBTN.tag = indexPath.row
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "vc")
        navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
