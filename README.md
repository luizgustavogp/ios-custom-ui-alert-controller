
# ios-custom-ui-alert-controller
Easy way to create you own UIAlertController


![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-04-03 at 18 23 07](https://user-images.githubusercontent.com/5147169/113492192-363a2c80-94ac-11eb-8455-d05db4314bac.png)

![Simulator Screen Shot - iPhone SE (2nd generation) - 2021-04-03 at 18 23 12](https://user-images.githubusercontent.com/5147169/113492204-4225ee80-94ac-11eb-9183-e5f3fca50558.png)


## Motivation
One of the main objectives of this project is the possibility to customize Alerts in Swift. **Feel free to customize it.**

## How to use

```swift
let customUIAlertController = CustomUIAlertController(title: "Lorem ipsum dolor sit amet", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquet justo eu massa elementum, eu pellentesque lacus iaculis. Suspendisse sit amet est feugiat, fringilla magna ut, facilisis tortor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.")
        
customUIAlertController.addAction(CustomUIAlertAction(title: "cancel", handler: {
    NSLog("The \"cancel\" alert occured.")
}))
        
customUIAlertController.addAction(CustomUIAlertAction(title: "ok, continue", invertColor: true, handler: {
    NSLog("The \"ok, continue\" alert occured.")
}))

present(customUIAlertController, animated: true, completion: nil)
```
