References:

- [Flutter ios not working:](https://stackoverflow.com/a/61320770/9399863)

````
if #available(iOS 10.0, *) {
  UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
  }
````
