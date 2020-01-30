//
//  ViewController.m
//  DemoObjc
//
//  Created by Richard on 29/01/2020.
//  Copyright © 2020 yourcompany. All rights reserved.
//

#import "ViewController.h"
@import Gifu;

@interface ViewController ()

@property (nonatomic, weak) IBOutlet GIFImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *imageDataLabel;
@property (nonatomic, strong) NSString *currentGIFName;

@end

@implementation ViewController

- (void)currentGIFName:(NSString *)currentGIFName
{
    _currentGIFName = currentGIFName;
    [self animate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentGIFName = @"mugen";
}

- (IBAction)toggleAnimation:(id)sender
{
    if (self.imageView.isAnimatingGIF) {
        [self.imageView stopAnimatingGIF];
    } else {
        [self.imageView startAnimatingGIF];
    }
    NSLog(@"%f", self.imageView.gifLoopDuration);
}

- (IBAction)swapImage:(id)sender
{
    if ([self.currentGIFName isEqualToString:@"mugen"]) {
        self.currentGIFName = @"earth";
    } else {
        self.currentGIFName = @"mugen";
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self animate];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.imageView prepareForReuse];
}

- (void)animate
{
    [self.imageView animateWithGIFNamed:self.currentGIFName
                              loopCount:0
                       preparationBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageDataLabel.text = [NSString stringWithFormat:@"%@ %zd frames / %.2f s", self.currentGIFName.capitalizedString, self.imageView.frameCount, self.imageView.gifLoopDuration];
        });
    } animationBlock:nil];
}

@end
