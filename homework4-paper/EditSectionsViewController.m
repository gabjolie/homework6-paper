//
//  EditSectionsViewController.m
//  homework4-paper
//
//  Created by Gabriele Angeline on 4/14/14.
//  Copyright (c) 2014 Gabriele Angeline. All rights reserved.
//

#import "EditSectionsViewController.h"

@interface EditSectionsViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet UIImageView *facebookCardView;
@property (weak, nonatomic) IBOutlet UIImageView *headlinesCardView;

- (IBAction)onDoneButton:(id)sender;
- (IBAction)onPan:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation EditSectionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // instantiate animator here
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    //CGPoint location = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    
    self.headlinesCardView.center = point;
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
        [UIView animateWithDuration:0.7 animations:^{
            CGPoint center = CGPointMake(0, 184);
            self.facebookCardView.center = center;
        }];
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Gesture changed: %@", NSStringFromCGPoint(point));
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
        if (velocity.y < 0) { //up
            [UIView animateWithDuration:1 animations:^{
                CGPoint location = CGPointMake(160, 184);
                self.headlinesCardView.center = location;
            }];
        } else if (velocity.y > 0) { //down
                [UIView animateWithDuration:0.7 animations:^{
                CGPoint location = CGPointMake(160, 535);
                self.headlinesCardView.center = location;
                CGPoint center = CGPointMake(159, 184);
                self.facebookCardView.center = center;
            }];
        }

    }
}

@end
