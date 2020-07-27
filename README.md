# AppBarTextFied()

A fully customisable Flutter AppBar widget with a switchable TextField mainly aiming for use as a search bar.

Built out of the frustration with limitations amd performance of similar widgets. This widget aims to be completely customisable and performant.
Both the AppBar and TextField are fully customizable.

The customisable search icon switches the AppBar to a TextField using a reveal animation. The widget directly exposes the TextField onChanged callback to allow a developer more flexibility in their application.

There is no opinionated search built in. You may use whatever state management you like. The example contains a basic search example.

![alt-text](https://github.com/elgansayer/appbar_textfield/blob/master/example.gif?raw=true)

```
appBar: AppBarTextfield(
    title: Text("Contacts"),
    onBackPressed: _onRestoreAllData,
    onClearPressed: _onRestoreAllData,
    onChanged: _onSearchChanged,
),
```

Dependencies
Using circular_reveal_animation from flutter pub
https://pub.dev/packages/circular_reveal_animation

Example Dependencies
faker: ^1.2.1
