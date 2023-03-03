//
//  memoDatailViewController.swift
//  MymemoApp
//
//  Created by eun-ji on 2023/03/03.
//

import UIKit
import CoreData

protocol memoDatailViewControllerDelegate : AnyObject{
    func didFinishSaveData() //fetch & reload
}


class memoDatailViewController: UIViewController {

    @IBOutlet weak var memoTextField: UITextView!
    @IBOutlet weak var DoneBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    weak var delegate: memoDatailViewControllerDelegate?
    
    var selectedMemoList: MemoList?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedMemoList { //선택한 셀에 값이 있으면(nil)이 아니면
            memoTextField.text = hasData.title
            deleteBtn.isHidden = false
            DoneBtn.setTitle("수정", for: .normal)
        }else {
            deleteBtn.isHidden = true
            DoneBtn.setTitle("완료", for: .normal)
        }
    }


    @IBAction func DoneBtn(_ sender: Any) {
        
        if selectedMemoList != nil{
            updateMemo()
        }
        if selectedMemoList == nil && !memoTextField.text.isEmpty {
            saveMemo()
        }
        delegate?.didFinishSaveData() //fetch & reload
        self.dismiss(animated: true)
    }
    
    func saveMemo() {
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "MemoList", in: context) else {return} // object 를 가져오기 위한 과정
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? MemoList else {return} //entity 안의 object 가져와서 값 저장
        
            object.title = memoTextField.text
            object.date = Date()
            object.uuid = UUID()
            
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            appDelegate.saveContext() // appdalegate에 있는 saveContext 가져오기
  
    }
    
    func updateMemo() {
        guard let hasData = selectedMemoList else {return}
        guard let hasUUID = hasData.uuid else {return}
        
        // 내용 불러오기
        let fetchRequest: NSFetchRequest<MemoList> = MemoList.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        // uuid로 조건을 부여 -> 셀렉한 uuid 만 가져오겠다.
        
        do {
            let lodedData = try context.fetch(fetchRequest)
            lodedData.first?.title = memoTextField.text
            lodedData.first?.date = Date()
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            appDelegate.saveContext()
            
        }catch{
            print(error)
        }
   
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        guard let hasData = selectedMemoList else {return}
        guard let hasUUID = hasData.uuid else {return}
        
        let fetchRequest : NSFetchRequest<MemoList> = MemoList.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let lodedData = try context.fetch(fetchRequest)
            if let lodeFirstData = lodedData.first {
                context.delete(lodeFirstData)
                let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
                appDelegate.saveContext()
            }
        }catch {
            print(error)
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
        
    }
    
    
}
