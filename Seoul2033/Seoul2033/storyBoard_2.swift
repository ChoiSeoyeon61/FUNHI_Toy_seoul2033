//
//  storyBoard_2.swift
//  Seoul2033
//
//  Created by 손영웅 on 2020/08/31.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

class storyBoard_2: UIViewController {

    //Outlet 모음
    @IBOutlet var deathAmount: UILabel!
    @IBOutlet var currentCookie: UILabel!
    @IBOutlet var maximumPages: UILabel!
    @IBOutlet var maximumItems: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkCookieAmount(cookie: santa.cookie)
        checkDeathAmount(death: santa.totalDying)
        checkMaxAbility(ability: santa.maxAbility)
        checkMaxPageAmount(page: santa.maxPage)
    }
    
    @IBAction func xButtonClicked2(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    //쿠키 텍스트로 표시하기
    func checkCookieAmount(cookie: Int){
        currentCookie.text = String(cookie)
    }
    func checkMaxPageAmount(page: Int){
        maximumPages.text = String(page)
    }
    func checkDeathAmount(death : Int){
        deathAmount.text = String(death)
    }
    func checkMaxAbility(ability : Int){
        maximumItems.text = String(ability)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

