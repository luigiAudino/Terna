//
//  VideoCell.swift
//  YoutubeVideoTerna
//
//  Created by Piero Junior Gaetani on 10/04/21.
//

//

import UIKit

class VideoCell: UITableViewCell {

    
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    @IBOutlet weak var videoWebView: UIWebView!
    
    
    func setVideo(video: Video) {
     
        videoWebView.loadRequest(URLRequest(url: URL(string: "https://www.youtube.com/embed/\(video.key)")!))
        videoTitleLabel.text = video.title
        print (video.key)
    }
    
}
