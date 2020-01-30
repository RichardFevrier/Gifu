#if os(iOS)
import UIKit
/// Example class that conforms to `GIFAnimatable`. Uses default values for the animator frame buffer count and resize behavior. You can either use it directly in your code or use it as a blueprint for your own subclass.
@objc
public class GIFImageView: GIFAnimatableView {
    
  public var image: UIImage?

  /// A lazy animator.
  private var _animator: Animator?
  
  override public var animator: Animator? {
    get {
      if (_animator == nil) {
        _animator = Animator(withDelegate: self)
      }
      return _animator
    }
    set {}
  }
  
  /// Layer delegate method called periodically by the layer. **Should not** be called manually.
  ///
  /// - parameter layer: The delegated layer.
  override public func display(_ layer: CALayer) {
    updateImageIfNeeded()
  }
}
#endif
