//
//  ViewController.swift
//  sampleTableView
//
//  Created by Eriko Ichinohe on 2018/01/19.
//  Copyright © 2018年 Eriko Ichinohe. All rights reserved.
//

import UIKit

//1.プロトコルを追加
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    var teaList = ["ダージリン","アールグレイ","アッサム","オレンジペコ"]
    var selectedRowIndex = -1  //何行目か保存されてないときを見分けるため-1を代入
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //4.ストーリーボード上で、myTableViewのdelegateとdataSourceをViewControllerと紐付ける（myTableView右クリックで設定可能）
        //myTableViewへ指示を出すのが、ViewControllerだと設定するためのもの（これがないと、セルに何も表示されない）
        
    }

    //2.行数の決定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return teaList.count
    }
    
    //3.1行に表示する文字列の作成、表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字列を表示するセルの取得（セルの再利用）
        // Cell ストーリーボードに設定したセルの名前
        //3-1.myTableViewにはストーリーボード上でCellを配置しておく
        //3-2.配置したセルには"Cell"という名前をつける。identifierの欄に記述
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //表示したい文字の設定
        //indexPath.row 今表示しようとしている行の行番号。0からスタート
//        cell.textLabel?.text = "\(indexPath.row)行目"
        cell.textLabel?.text = teaList[indexPath.row]
        
        //文字設定したセルを返す
        return cell
    }
    
    //セルをタップした時発動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //タップされた行の番号 indexPath.row
        print("\(teaList[indexPath.row])がタップされました")
        
        //選択された行番号をメンバ変数に保存（セグエを使って画面移動する時に発動するメソッドが違うもののため、そこで使えるようにする）
        selectedRowIndex = indexPath.row
        
        //セグエの名前を指定して、画面遷移処理を発動（付ける名前はshowDetail。ストーリーボード上でidentifierで指定）
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    //セグエを使って画面遷移してる時発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //複数セグエがある場合、segue.identifierで判別可能
        
        //移動先の画面のインスタンスを取得
        //segue.destination セグエが持っている、目的地（移動先の画面）
        //as ダウンキャスト変換 広い範囲から限定したデータ型へ型変換するときに使用
        //as! 型変換して、オプショナル型からデータを取り出す
        var dvc:DetailViewController = segue.destination as! DetailViewController
        //移動先の画面のプロパティに、選択された行番号を代入（これで、DetailViewControllerに選択された行番号が渡せる）
        dvc.passedIndex = selectedRowIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

