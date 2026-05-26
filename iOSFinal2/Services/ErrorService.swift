import Foundation
import UIKit
class ErrorService {
    static let shared = ErrorService()
    
    func handleError(description: Error, fatal: Bool = false) {
        if (fatal) {
            let alert = UIAlertController(title: "An Error Occured",
                                          message: description.localizedDescription,
                                         preferredStyle: .alert)
            
            // Default action
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            alert.present(alert, animated: true, completion: {})

        } else {
            print(description)
        }
    }
}
