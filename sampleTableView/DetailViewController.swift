//
//  DetailViewController.swift
//  sampleTableView
//
//  Created by Eriko Ichinohe on 2018/01/19.
//  Copyright © 2018年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //選択された行番号が受け渡されるプロパティ
    var passedIndex = -1  //渡されていないことを判別するために-1を代入
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("渡された行番号:\(passedIndex)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
