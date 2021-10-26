# Godot-Awesome-Debug-Print
Inspired by https://github.com/gruns/icecream

Better debug information using `ad.p(arg)` rather than `print(arg)`

Awesome Debug returns the input argument so it can be dropped into existing code without issue.

# Installation
Godot Awesome Debug Print needs to be enabled as a [singleton](https://docs.godotengine.org/en/stable/getting_started/step_by_step/singletons_autoload.html) with name "ad"


![Image of project settings autoload configuration](https://i.imgur.com/QYHm2FV.png)

# Use
Debug print with `ad.p(arg)`
```gdscript
var myString = "Hello World"
ad.p(myString)
```
`1635267189|    string|                     : Hello World                                                _ready   39 res://Player/player.gd`
___
Add a description to your debug print with `ad.d(description, arg)`
```gdscript
var myNumber = 10
ad.d("very important number", myNumber)
```

`1635267628|       int| very important number: 10                                                         _ready   39 res://Player/player.gd`

# Performance
Turn off each debug print with `ad.off(arg)` or `ad.off_d(description, arg)`

Enable and disable chunks of debug prints with `ad.enable()` and `ad.disable()`
