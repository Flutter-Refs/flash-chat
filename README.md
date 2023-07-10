# flash_chat

* [Named Routes](https://docs.flutter.dev/cookbook/navigation/named-routes)
* [Animations](https://docs.flutter.dev/ui/animations)
  
  * [Hero Animations](https://docs.flutter.dev/ui/animations/hero-animations)
  
  * Custom Animations
    ```
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );
    ```
  
  * Curve Animations
    ```
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    ```
  
  * ColorTween
    ```
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );

    animation = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(animationController);
    ```
  * [Animated Text Kit](https://pub.dev/packages/animated_text_kit)

* Disposable Widget
  ```
  @override
  void dispose() {
    super.dispose();
    animationController.dispose()
  }
  ```

* Mixins
  ```
  void main() {
  }

  class Animal {
    void move (){
      print('changed position');
    }
  }

  class Fish extends Animal{
    @override
    void move(){
      super.move();
      print('by swimming');
    }
  }

  class Bird extends Animal{
    @override
    void move(){
      super.move();
      print('by flying');
    }
  }

  class Duck extends Animal with CanSwim, CanFly {
  }

  mixin CanSwim {
    void swim(){
      print('Changing position by swimming');
    }
  }

  mixin CanFly {
    void fly(){
      print('Changing position by flying');
    }
  }
  ```