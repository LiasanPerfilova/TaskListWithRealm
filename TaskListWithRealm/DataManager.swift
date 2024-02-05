//
//  DataManager.swift
//  TaskListWithRealm
//
//  Created by Liaisan on 2/5/24.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    private let storageManager = StorageManager.shared
    
    private init() {}
    
    func createTempData(completion: @escaping () -> Void) {
        let shoppingList = TaskList()
        shoppingList.title = "Shopping List"
        
        let milk = Task()
        milk.title = "Milk"
        milk.note = "2L"
        
        shoppingList.tasks.append(milk)
        
        let bread = Task(value: ["Bread", "", Date(), true] as [Any])
        let apples = Task(value: ["title": "Apples", "note": "2Kg"])
        
        shoppingList.tasks.insert(contentsOf: [bread, apples], at: 1)
        
        let moviesList = TaskList(value: [
            "Movies List",
            Date(),
            [
                ["Avatar"] as [Any],
                ["Titanic", "Must watch", Date(), true]
            ]
        ] as [Any]
        )
        
        DispatchQueue.main.async { [unowned self] in
            storageManager.save([shoppingList, moviesList])
            completion()
        }
        
        
    }
}

