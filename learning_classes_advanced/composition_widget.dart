// "Composition" is an OOP design pattern that describes a `HAS-A` relationship between objects.
// When we write code, understanding the correct relationship between entities is important.
// NOTE: In Flutter, composition is heavily used to describe how an application's UI looks like. And in Flutter, everything drawn on a screen is called a `Widget`.

// Simplified version of widget class hierarchy in FLuter:
// This would be the base class for all widgets in Flutter, and it is abstract, because it's up to subclasses to decide how to draw things on screen.
abstract class Widget {}

class Text extends Widget {
  Text(this.text);
  final String text; // This represents the text that we want to draw.
}

class Button extends Widget {
  Button({required this.child, this.onPressed});
  final Widget child;
  final void Function()? onPressed;
}
// What we have here is a simple class hierarchy that defines a base `Widget` abstract class, and two subclasses called `Text` and `Button` that represent specific UI widgets. And we're using inheritance because a `Text` 'is a' widget, and a `Button` 'is a' widget.

void main(List<String> args) {
  final button = Button(
    child: Text('Press Me'),
    // This shows the power of "composition" because the `Button` class doesn't know what kind of child it should have. All it cares about is that it is given a child `Widget`. And because all widgets have the same base `Widget` class (or extends `Widget`), here we can pass any widget we want as an argument.
    onPressed: () => print('button pressed'),
  );
}
// NOTE: The approach of composition is very "scalable", because we can use composition to combine widgets together and create complex UIs. So one one hand, when you write apps in FLutter, then you can use composition to define how your UI looks like.

// NOTE: Inside the FLutter SDK, both `inheritance` and `composition` are used to create an extensive catalog of widget classes. 

// NOTE: Composition and Inheritance are both very important, and you can use "Composition" to model `HAS-A` relationships, and you an use "Inheritance" to model `IS-A` relationships. 
