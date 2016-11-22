//
//  ViewController.swift
//  chatRomeDemo
//
//  Created by 张锦辉 on 2016/11/21.
//  Copyright © 2016年 张锦辉. All rights reserved.
//

import UIKit

class ChatRoom {
    
    var roomId:Int = 0
    var users:[Users] = []
    
    init(chatRoomId:Int) {
        self.roomId = chatRoomId
    }
    
    func sendMsg(msg:String) -> Void {
        for aMemters in users {
            aMemters.reciveMessage(msg)
        }
    }
    
    //用户进入聊天室
    func acept(userEnter user:Users) -> Void {
        sendMsg("进入房间\(roomId) :"+user.name)
        users.append(user)
    }
    
    //用户离开聊天室
    func leave(userLevel user:Users) -> Void {
        sendMsg("离开房间\(roomId) :"+user.name)
    }
}

class Users {
    weak var chatRoom:ChatRoom?
    var name:String
    init(name:String) {
    self.name = name
    }
    
    //用户进入聊天室
    func enterChatRoom(chatRoom:ChatRoom) -> Void {
        chatRoom.acept(userEnter: self)
        self.chatRoom = chatRoom
    }
    
    //用户离开聊天室
    func levelChatRoom(chatRoom:ChatRoom) -> Void {
        chatRoom.leave(userLevel: self)
        self.chatRoom = chatRoom
    }
    
    //接收消息
    func reciveMessage(msg:String) -> Void {
        print("接收消息：" + msg);
    }
    
    //发送消息
    func sendMessage(chatMsg msg:String) -> Void {
        if let aChatRoom = chatRoom{
            aChatRoom.sendMsg(msg)
        }
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jack = Users(name: "jack")
        let chatRoom:ChatRoom = ChatRoom(chatRoomId: 1)
        jack.enterChatRoom(chatRoom)
        chatRoom.sendMsg("全员通知")
        
        jack.sendMessage(chatMsg: "新人报道");
        jack.levelChatRoom(chatRoom)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}




