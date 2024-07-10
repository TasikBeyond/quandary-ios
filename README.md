# quandary-ios

An attempt was made to reproduce an issue where, when dismissed via a webview, the UIHostingViewController's content fails to adjust properly, leaving the content offset.

In this project, an "Avatar View" is created within the frame of the keyboard.

When the keyboard is presented, it automatically adjusts the position of the component set to UIHostingViewController.view.

More experimentation is needed to reproduce the content offset issue when the keyboard is dismissed.
