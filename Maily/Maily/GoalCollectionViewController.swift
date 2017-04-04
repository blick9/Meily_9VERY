//
//  GoalCollectionViewController.swift
//  Maily
//
//  Created by Danb on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GoalCollectionViewController: UICollectionViewController {
    
    
    
    var goalTitlesArray = ["lose weight 3kg until March","All pass weekly Test","333","444","51135452434","dafdasf","asdfasdf","asdfasdf"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addGoalButton = UIButton(frame: CGRect(x: 270, y: 500, width: 96, height: 100))
        addGoalButton.setImage(#imageLiteral(resourceName: "Add_Bt"), for: .normal)
        addGoalButton.addTarget(self, action: #selector(presentGoalAddView), for: .touchUpInside)
        self.view.addSubview(addGoalButton)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func presentGoalAddView() {
        let goalAddSB = UIStoryboard(name: "Goal_add", bundle: nil)
        let goalAddVC = goalAddSB.instantiateViewController(withIdentifier: "GoalAdd")
        present(goalAddVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
/*
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
*/

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return goalTitlesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GoalCollectionViewCell
        cell.goalCardTitle.text = goalTitlesArray[indexPath.row]
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
