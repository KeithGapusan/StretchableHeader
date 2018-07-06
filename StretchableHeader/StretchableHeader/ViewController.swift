//
//  ViewController.swift
//  StretchableHeader
//
//  Created by Keith Gapusan on 06/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        tableView.backgroundColor = UIColor.darkGray
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.image = UIImage.init(named: "poster")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        UIApplication.shared.statusBarStyle = .default
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        switch indexPath.row % 2 {
        case 0:
            cell.titleLabel.text = "Lorem Ipsum is simply dummy text ."
            cell.contentView.backgroundColor = UIColor.darkGray
        default:
            cell.contentView.backgroundColor = UIColor.black
            cell.titleLabel.text = "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."
            cell.titleLabel.textColor = .white
            
            
        }
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let  y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 10), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        
        if imageView.alpha <= 0{
            // UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
            //imageView.alpha = 1
            //imageView.backgroundColor = UIColor.black
            imageView.alpha = y/300
        }else{
            
            imageView.alpha = y/300
        }
        var offset = scrollView.contentOffset.y
        if offset  > 1{
            offset = 1
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        }else{
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        }
    }
}
