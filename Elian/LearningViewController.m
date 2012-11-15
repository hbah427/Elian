//
//  LearningViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "LearningViewController.h"
#import "GameViewController.h"
#import "Game.h"

@interface LearningViewController ()

@end

@implementation LearningViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) setDifficulty:(id)sender {
    UIButtonWithToggle* b = (UIButtonWithToggle*) sender;
    b.tag = 1;
    b.alpha = 1;
    if ([b.titleLabel.text isEqualToString:@"s"]) {
        _mediumButton.tag = 0;
        _mediumButton.alpha = 0.5;
        _longButton.tag = 0;
        _longButton.alpha = 0.5;
    }
    if ([b.titleLabel.text isEqualToString:@"m"]) {
        _shortButton.tag = 0;
        _shortButton.alpha = 0.5;
        _longButton.tag = 0;
        _longButton.alpha = 0.5;
    }
    if ([b.titleLabel.text isEqualToString:@"l"]) {
        _mediumButton.tag = 0;
        _mediumButton.alpha = 0.5;
        _shortButton.tag = 0;
        _shortButton.alpha = 0.5;
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GameViewController *gvc = (GameViewController*)[segue destinationViewController];
    NSManagedObjectContext *moc = super.managedObjectContext;
    NSPersistentStoreCoordinator *psc = moc.persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel =
    [psc managedObjectModel];
    NSEntityDescription *entity =
    [[managedObjectModel entitiesByName] objectForKey:@"Game"];
    NSManagedObject *newGame = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:super.managedObjectContext];
    gvc.currentGame = (Game*)newGame;
    if (_longButton.tag == 1) {
        gvc.currentGame.gameSize = @26;
    }
    else if (_mediumButton.tag == 1) {
        gvc.currentGame.gameSize = @18;
    }
    else {
        gvc.currentGame.gameSize = @10;
    }
    if ([segue.identifier isEqualToString:@"Elian"])
        gvc.currentGame.isElianToEnglish = YES;
    else
        gvc.currentGame.isElianToEnglish = NO;
}

- (void)viewDidUnload {
    [self setShortButton:nil];
    [self setMediumButton:nil];
    [self setLongButton:nil];
    [super viewDidUnload];
}
@end
