//
//  ViewController.swift
//  MymemoApp
//
//  Created by eun-ji on 2023/03/03.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var memoTableView: UITableView!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var memoList = [MemoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "memo"
        
        memoTableView.delegate = self // 동작 , 셀을 클릭했을 때 등
        memoTableView.dataSource = self // 뷰를 그려주는 역할 , 셀의 개수 등
        memoTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        fetchData()
        memoTableView.reloadData()
        navigationBarItem()
     
        
    }
    
    func navigationBarItem() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMemo))
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func addNewMemo() {
        let detailVC = memoDatailViewController.init(nibName: "memoDatailViewController", bundle: nil)
        
        detailVC.delegate = self
        self.present(detailVC, animated: true)
    }
    
    
    func fetchData(){ // 데이터 불러오기
        let fetchRequest: NSFetchRequest<MemoList> = MemoList.fetchRequest()
        let context = appdelegate.persistentContainer.viewContext
        
        do {
            self.memoList = try context.fetch(fetchRequest)
        }catch{
            print(error)
        }
    }
}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath) as! memoCell
        
        cell.titleLabel.text = memoList[indexPath.row].title
        
        if let hasDate = memoList[indexPath.row].date {
            let fomatter = DateFormatter()
            fomatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = fomatter.string(from: hasDate)
            cell.dateLabel.text = dateString
        }else {
            cell.dateLabel.text = ""
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)// 눌린거 해제
        let detailVC = memoDatailViewController.init(nibName: "memoDatailViewController", bundle: nil)
        
        detailVC.delegate = self
        detailVC.selectedMemoList = memoList[indexPath.row]
        self.present(detailVC, animated: true)
    }
    
}

extension ViewController: memoDatailViewControllerDelegate{
    func didFinishSaveData() {
        self.fetchData()
        self.memoTableView.reloadData()
    }
}
