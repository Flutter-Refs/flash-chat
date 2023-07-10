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
  
  ```