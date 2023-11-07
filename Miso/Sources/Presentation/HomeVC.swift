import UIKit

class HomeVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        FontCheck()
        
        view.backgroundColor = .blue
        
    }
    
    func FontCheck() {
        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }

    }

}

