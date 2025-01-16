//In the observer, always check if the observed object is still valid before accessing its properties.
@interface MyObserver : NSObject
@property (nonatomic, weak) MyObservedObject *observedObject;
@end

@implementation MyObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (self.observedObject) {
        // Access properties of observedObject safely
        NSLog("Observed value changed: %@
", [self.observedObject valueForKeyPath:keyPath]);
    } else {
        // Handle the case where the observed object is nil.
    }
}
@end

// Remove observer in dealloc method of observer to prevent dangling pointer
- (void)dealloc {
    if(self.observedObject) {
       [self.observedObject removeObserver:self forKeyPath:@"observedProperty"];
    }
    [super dealloc];
} 