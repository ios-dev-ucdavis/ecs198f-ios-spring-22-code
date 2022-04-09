# Hints for Assignment 1

> All content listed below might be needed for finishing your assignment one. If you want to start assignment 1 early (over this weekend) and get stuck, you can refer to this document for inspiration. We will also go over all things next Tuesday.

## Shape

`Shape` is a collection of useful `View`s in SwiftUI for creating shapes, as the name suggested. We have `Rectangle`, `Circle`, `Capsule`, and more. The declaration of these `Shape`s is exactly the same as other views. For example:

``` swift
Circle() // A Circle view (shape)
Rectangle() // A Rectangle view (shape)
```

To fill the color inside a shape, you can take a look at `.fill()` view modifier in the document. In short, you can pass in a `Color`.

## Stack Views on Top of Each Other

There are majorly three ways of stacking views on Z-axis (from bottom to top).

1. Use `ZStack`

    For example:

    ``` swift
    // Stack a `Text` on top of `Circle`
    ZStack {
        Circle()
        Text("hello")
    }
    ```

2. Use `.background()` view modifier

    For example:

    ``` swift
    // Stack a `Text` on top of the red `Color`
    Text("Hello")
        .background(Color.red)
    ```

    **Additional Notes:**

    `.background()` can also take a complex `View` as its argument, in a trailing closure form. For example:
    
    ``` swift
    Text("hello")
        .background {
            VStack(spacing: 0) {
                Color.red
                Color.green
                Color.blue
            }
        }
    ```

3. Use `.overlay()` view modifier

    For example:

    ``` swift
    // Stack a `Text` on top of a red `Color`
    Color.red
        .overlay(Text("Hello"))
    ```

## `if-else` statement in SwiftUI

You can use `if-else` statement to display `View`s conditionally.

For example:

``` swift
// You can change this flag to true to see the difference.
var showFillCapsule = false
    
var body: some View {
    if showFillCapsule {
        Image(systemName: "capsule.fill")
    } else {
        Image(systemName: "capsule")
    }
}
```

Furthermore, you can also dynamically change the flag by responding to a button click. For example:

``` swift
// Why we need the @State here? (We've discussed during lecture)
@State var showFillCapsule = false

var body: some View {
    VStack {
        if showFillCapsule {
            Image(systemName: "capsule.fill")
        } else {
            Image(systemName: "capsule")
        }
        
        Button("Toggle") {
            self.showFillCapsule.toggle()
            // `.toggle()` function comes with evey boolean variable.
            // It will change the boolean to true if it's false and vice versa.
        }
    }
}
```

It also works if such flag variable is stored inside another struct, just like what we did during the lecture.

Also, you can use `if-else-elseif` statement, `switch` statement, or even just a `if` statement.

## Utilize Ternary Operator

Sometimes, you may want to simplify the `if-else` statement further by using ternary operator. For example:

``` swift
@State var showFillCapsule = false

var body: some View {
    VStack {
        Image(
            systemName: self.showFillCapsule ? "capsule.fill" : "capsule"
        )
        
        Button("Toggle") {
            self.showFillCapsule.toggle()
        }
    }
}
```

Ternary operator can be really powerful when it is used inside view modifiers.

For example:

``` swift
// View declaration is omitted.
.foreground(.red.opacity(disabled ? 0.5 : 1)) // Assume `disabled` is a boolean variable.
```

## Respond to Tap Behavior without a Button

You may want to tap on some UI `View`s, but what if they are not `Button`s?

You can use `.onTapGesture()` view modifier. Take the example from above, we can have something like this:

``` swift
@State var showFillCapsule = false
    
var body: some View {
    VStack {
        if showFillCapsule {
            Image(systemName: "capsule.fill")
                .onTapGesture {
                    self.showFillCapsule.toggle()
                }
        } else {
            Image(systemName: "capsule")
                .onTapGesture {
                    self.showFillCapsule.toggle()
                }
        }
    }
}
```

In this case, I remove the `Button`, and let user to tap on the icon to change the icon.

As you can see, the function you pass into the `.onTapGesture` view modifier is a trailing closure.

We will talk about more advanced gesture handling later.

## Remove Repeated Code by Using `Group`

From the example above, you can see we defined `.onTapGesture` twice and they are exactly the same code. We can utilize Group to reduce the redundancy. For example:

``` swift
@State var showFillCapsule = false
    
var body: some View {
    VStack {
        Group {
            if showFillCapsule {
                Image(systemName: "capsule.fill")
            } else {
                Image(systemName: "capsule")
            }
        }
        .onTapGesture {
            self.showFillCapsule.toggle()
        }
    }
}
```

Of course, you can also define the `.onTapGuesture` on the outter `VStack`, instead of using `Group`. It will achieve the same effect in this simple case.

## Scale `Image`

You can scale `Image` in SwiftUI by using `.frame()` view modifier.

For example (**NOT WORKING**)

``` swift
var body: some View {
    VStack {
        Image(systemName: "capsule.fill")
        Image(systemName: "capsule")
            .frame(width: 100, height: 100)
    }
}
```

We set the frame of the second icon to 100x100. However, it won't work if you check it inside the simulator. The reason is, by default, all `Image`s in SwiftUI are not allowed to be resized or scaled. You can explicitly bypass this constraint by using `.resizable()` view modifier. For example:

``` swift
var body: some View {
    VStack {
        Image(systemName: "capsule.fill")
        Image(systemName: "capsule")
            .resizable() // Use this!
            .frame(width: 100, height: 100)
    }
}
```

## Misc

You may also want to know how to add shadow, change opacity, do a strikethrough, and more for assignment 1. However, I won't explicitly talk about them. You have the complete freedom to search online and look at the document! Knowing how to find useful things online or in document is also an important skill for an SDE!

If you really get stuck on something, feel free to post on GitHub Discussion, Discord, or come to OHs!
