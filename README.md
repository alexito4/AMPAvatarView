AMPAvatarView
=============

A simple UIView subclass that shows an UIImage with a shadow in a circle.

**Posted to put Objective-C [Back on the Map](https://objectivechackathon.appspot.com/) again!**

Usage
=============
You can create an instance of this view using code or IB. 

    AMPAvatarView *avatar = [[AMPAvatarView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    avatar.image = [UIImage imageNamed:@"avatar"];
    [self.view addSubview:avatar];
    
You can change some properties. 

- The image (really?)
- Border width
- Border color
- Shadow radius
- Shadow color

Example
=============
Just a simple example to show how you can change a couple of things.

![AMPAvatarView example](/example.png "Project example")

## Installation

AMPAvatarView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "AMPAvatarView"

## Author

Alejandro Martinez, alexito4@gmail.com

## License

teste is available under the MIT license. See the LICENSE file for more info.




