//
//  ViewController.swift
//  03-PlayLocalVideo
//
//  Created by 张延 on 2017/8/28.
//  Copyright © 2017年 com.CocoaLemon.www. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class ViewController: UIViewController {

    var tableView : UITableView?
    var player : AVPlayer?
    var playerVC : AVPlayerViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        title = "Watch Later"
        // 导航栏颜色
        navigationController?.navigationBar.barTintColor = UIColor.black
        // 导航栏title颜色
        let dic : NSDictionary = [NSForegroundColorAttributeName : UIColor.white,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
        navigationController?.navigationBar.titleTextAttributes = dic as? [String : Any]
        navigationController?.navigationBar.isTranslucent = false
        setUpTableView()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        // 状态栏的高度20，导航栏44
        return UIStatusBarStyle.lightContent
    }
    // MARK:设置UITableView
    func setUpTableView() {
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tableView?.delegate = self
        tableView?.dataSource = self
//        tableView?.register(VideoCell.self, forCellReuseIdentifier: "ZYVideoCell")
        tableView?.register(UINib.init(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "ZYVideoCell")
        tableView?.rowHeight = 200
        view.addSubview(tableView!)
        
    }
    // MARK:懒加载
    lazy var imgNameArr = {
        
        return ["videoScreenshot01","videoScreenshot02","videoScreenshot03","videoScreenshot04","videoScreenshot05","videoScreenshot06"]
    }()

}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imgNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZYVideoCell", for: indexPath) as! VideoCell
        cell.backImgView.image = UIImage(named: imgNameArr[indexPath.row])
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 定义一个文件路径
        let filePath = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
    //定义一个视频播放器，通过本地文件路径初始化
         player = AVPlayer(url: videoURL)
         playerVC = AVPlayerViewController()
        playerVC?.player = player
        navigationController?.pushViewController(playerVC!, animated: true)
    }
    
}
