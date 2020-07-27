# appbar_textfield

A flutter AppBar widget with a switchable TextField mainly used for search

Build out of the frustration with limitations of similar widgets.
Tis widget aims to be completely customisable and performant.
The AppBar is fully customizable
The TextField is fully customizable

Using a default search icon. Switches the AppBar to a TextField search bar.
Directly using onChanged from TextField to allow a developer to use the text value as they desire.

There is no opinionated search built in. The example contains a basic search example.

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
