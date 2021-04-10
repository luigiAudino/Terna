//
//  VideoListScreen.swift
//  YoutubeVideoTerna
//
//  Created by Piero Junior Gaetani on 10/04/21.
//

import UIKit

class VideoListScreen: UIViewController {
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyleNavBar()
        videos = createArray()
     /*   var image : UIImage = UIImage(named:"youtube")!
        imageViewHolder = UIImageView(image: image ) */
    }
    
    
    func createArray() -> [Video] {
        
        let video1 = Video(key: "0u-eSwKtrDQ", title: "Terna for #Cortina2021​")

        let video2 = Video(key: "JhJenWJSJZg", title: "CEO Stefano Donnarumma")
        let video3 = Video(key: "LN--N5Rj25M", title: "Domenica Conenna ")
        let video4 = Video(key: "z3irYUdjQNQ", title: "Anastasia Chiricozzi ")
        let video5 = Video(key: "yTl8mgv8790", title: "Matteo Urbanaz")       
        let video6 = Video(key: "jcPUZuWUn-w", title: "Massimo Lozito")
        let video7 = Video(key: "6QT9G6YCC5A", title: "#MrTerna​: Chi è Terna?")
        let video8 = Video(key: "krn5JimXh-o", title: "Siamo Terna")
        let video9 = Video(key: "ujR20AUXMd0", title: "Sviluppo Sostenibile")
        let video10 = Video(key: "zPouTv81Q1c", title: "Transizione energetica")
    
        return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    }
}


extension VideoListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        cell.setVideo(video: video)
        
        return cell
    }
    
    func setStyleNavBar() {
        self.navigationController?.navigationBar.barTintColor = Color.firstBlue
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
}





