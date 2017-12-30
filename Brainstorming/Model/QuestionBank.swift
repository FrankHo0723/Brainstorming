//
//  QuestionBank.swift
//  Brainstorming
//
//  Created by Frank on 2017/12/30.
//  Copyright © 2017年 Frank. All rights reserved.
//

import Foundation

class questionBank{
    var list=[Question]()
    
    init(){
        let item = Question(text:"現在肚子餓嗎？", correctAnswer:true)
        list.append(item)
        list.append(Question(text:"明天會早起嗎？", correctAnswer:true))
        list.append(Question(text:"品客比樂事好吃嗎？", correctAnswer:false))
        list.append(Question(text:"期末考會歐趴", correctAnswer:true))
        list.append(Question(text:"今天有下雨嗎？", correctAnswer:false))
    }
}
