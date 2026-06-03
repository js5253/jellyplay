import Foundation
import UIKit
class ErrorService {
    let PRODUCTION = false // logs all errors to console if it's not true
    static let shared = ErrorService()
    
    func handleError(description: Error, fatal: Bool = false) {
        if (fatal && PRODUCTION) {
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
