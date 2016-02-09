//
//  ViewController.swift
//  HelloCoreData
//
//  Created by David Rothschild on 2/9/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var users = [NSManagedObject]()

    @IBAction func saveUser(sender: UIButton) {
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let user = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        user.setValue("Oliver", forKey: "firstName")
        user.setValue("remoteinstructors@village88.com", forKey: "email")
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success \(user)")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = appDelegate.managedObjectContext
        let users = [
            ["firstName": "John", "email": "john.blake@example.com"],
            ["firstName": "Rodney", "email": "rodney.roberts20@example.com"]
        ]
        for user in users {
            let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: managedObjectContext) 
            newUser.setValue(user["firstName"], forKey: "firstName")
            newUser.setValue(user["email"], forKey: "email")
        }
        
        if managedObjectContext.hasChanges{
            do {
                try managedObjectContext.save()
                print("Success")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //31
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //32
        let userRequest = NSFetchRequest(entityName: "User")
        
        // 3
        do {
            
            let results = try managedObjectContext.executeFetchRequest(userRequest)
            let users1 = results as! [User]
                for user in users1 {
                    print("\(user.firstName) and \(user.email)")
                    }
            
        } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
    


}

