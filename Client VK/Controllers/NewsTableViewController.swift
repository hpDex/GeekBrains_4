//
//  NewsTableViewController.swift
//  Client VK
//
//  Created by DENIS FILIPPOV on 20.02.2022.
//  Copyright © 2022 DENIS FILIPPOV. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var postNewsList = [
        PostNews(name: "Victor", avatar: UIImage(named: "person1"), date: "Вчера в 17:19", textNews: "Телеканал CBS в США утверждает, что Россия отдала приказ войскам о «вторжении» на Украину", imageNews: UIImage(named: "news1")),
        PostNews(name: "Валентин", avatar: UIImage(named: "person2"), date: "20.02.2022 в 14:08", textNews: "Более 53 тысяч беженцев из Донбасса пересекли границу России.", imageNews: UIImage(named: "news2")),
        PostNews(name: "Турин", avatar: UIImage(named: "person3"), date: "20.02.2019 в 14:08", textNews: "Блинкен: США ответят на действия России даже без полномасштабного «вторжения»", imageNews: UIImage(named: "news3")),
        
        PostNews(name: "Victor", avatar: UIImage(named: "person1"), date: "Вчера в 17:19", textNews: "", imageNews: UIImage(named: "news1")),
        PostNews(name: "Валентин", avatar: UIImage(named: "person2"), date: "20.02.2022 в 14:08", textNews: "", imageNews: UIImage(named: "news2")),
        PostNews(name: "Турин", avatar: UIImage(named: "person3"), date: "20.02.2019 в 14:08", textNews: "", imageNews: UIImage(named: "news3"))
    ]


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postNewsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String
        
        if postNewsList[indexPath.row].textNews.isEmpty {
            identifier = "PhotoCell"
            print(identifier)
        } else {
            identifier = "PostCell"
            print(identifier)
        }
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NewsTableViewCell
        
        // аватар
        cell.avatarUserNews.avatarImage.image = postNewsList[indexPath.row].avatar
        // имя автора
        cell.nameUserNews.text = postNewsList[indexPath.row].name
        // дата новости
        cell.dateNews.text = postNewsList[indexPath.row].date
        cell.dateNews.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        cell.dateNews.textColor = UIColor.gray.withAlphaComponent(0.5)
        //текст новости
        //cell.textNews.text = postNewsList[indexPath.row].textNews
        //cell.textNews.numberOfLines = 0
        if identifier == "PostCell" {
            cell.textNewsPost.text = postNewsList[indexPath.row].textNews
        }
        
        //картинка к новости
        cell.imgNews.image = postNewsList[indexPath.row].imageNews
        cell.imgNews.contentMode = .scaleAspectFill

        return cell
    }

}
