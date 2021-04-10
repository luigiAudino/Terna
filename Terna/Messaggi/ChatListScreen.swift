//
//  VideoListScreen.swift
//  BeginnerTableView
//

//
//  Created by Piero Junior Gaetani on 10/04/21.
//

import UIKit

class ChatListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var conversazioni: [Chat] = []
    
    private var selectedchat : Chat?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversazioni = createArray()
        
        
    }
    
    
        
       
   
    
    
    func createArray() -> [Chat] {
        
        let chat1 = Chat(image: #imageLiteral(resourceName: "chatbot"), title: "TernaBot", ultimoMessaggioLabel: "Sono disponibile 24h/24", dataLabel: "10/04",chatAnimation: true)
        let chat2 = Chat(image: #imageLiteral(resourceName: "referente"), title: "Referente Cervo", ultimoMessaggioLabel: "Ricordati di fare commit 😝", dataLabel: "08/04",chatAnimation: true)
        let chat3 = Chat(image: #imageLiteral(resourceName: "Luigi"), title: "Luigi Audino", ultimoMessaggioLabel: "Lunedì si lavora dalle 10.00", dataLabel: "06/04",chatAnimation: false)
        let chat4 = Chat(image: #imageLiteral(resourceName: "LuigiS"), title: "Luigi Scherillo", ultimoMessaggioLabel: "non ti dimenticare la email!😘", dataLabel: "05/04",chatAnimation: false)
        let chat5 = Chat(image: #imageLiteral(resourceName: "Piero"), title: "Piero J. Gaetani", ultimoMessaggioLabel: "Domani  Pizza🍕", dataLabel: "03/04",chatAnimation: false)
      
    
        return [chat1, chat2, chat3, chat4, chat5]
    }

}

extension ChatListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversazioni.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = conversazioni[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatCell
        cell.setChat(chat: chat , chatAnimation: chat.chatAnimation)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        self.selectedchat = conversazioni[indexPath.row]
        self.performSegue(withIdentifier: "goToChatBot", sender: nil)
    }
}





