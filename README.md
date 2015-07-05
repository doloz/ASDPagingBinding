# ASDPagingBinding
Just look at this GIF and you'll understand how it works:

![ASDPagingBinging in action](https://cloud.githubusercontent.com/assets/8708217/8511201/8d240866-2326-11e5-958f-9533f7c361e5.gif)

## How to install
Drag and drop all repository files to your Xcode project. Then make `#import "ASDPagingBinding.h"` where you want to use it.

## How to use 
For example,
```
// create a property
@property (nonatomic) ASDPagingBinding *binding;

// somewhere in -viewDidLoad method
self.binding = [[ASDPagingBinding alloc] initWithSegmentedControl:mySegmentedControl scrollView:myScrollView];
self.binging.animatedScrolling = NO; // do this only if you want to perform scrolling immediately
```
That's it. Now everything should work.
If at some moment you decide to unbind scroll view, you just need binding to be deallocated:
```
self.binding = nil;
```

## Other information
Now class supports only horizontal scrolling
