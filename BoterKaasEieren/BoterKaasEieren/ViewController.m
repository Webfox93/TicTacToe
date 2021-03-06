//
//  ViewController.m
//  BoterKaasEieren
//
//  Created by Furkan on 9/11/13.
//  Copyright (c) 2013 Groep 1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize gelijkspel;
@synthesize aantalZetten;
@synthesize btnPlay;
@synthesize gewonnen;
@synthesize btn1;
@synthesize btn2;
@synthesize btn3;
@synthesize btn4;
@synthesize btn5;
@synthesize btn6;
@synthesize btn7;
@synthesize btn8;
@synthesize btn9;
@synthesize label;
@synthesize beatable;

- (void)start
{
    vakjesLijst = [[NSMutableArray alloc]init];
    [vakjesLijst addObject:btn1];
    [vakjesLijst addObject:btn2];
    [vakjesLijst addObject:btn3];
    [vakjesLijst addObject:btn4];
    [vakjesLijst addObject:btn5];
    [vakjesLijst addObject:btn6];
    [vakjesLijst addObject:btn7];
    [vakjesLijst addObject:btn8];
    [vakjesLijst addObject:btn9];
    label.text = @"Speler begint.";
}

- (IBAction)manageButton:(id)sender
{
    if ([sender isEqual:btnPlay]) {
        [self reset];
    } else if ([sender isEqual:beatable]) {
        UIActionSheet * alert = [[UIActionSheet alloc] initWithTitle:@"Nieuw spel?" delegate:self cancelButtonTitle:@"Annuleer." destructiveButtonTitle:@"OK." otherButtonTitles: nil];
        [alert showInView:self.view];
        [alert release];
    } else if(!gewonnen && !gelijkspel && [sender currentTitle] == nil) {
        [sender setTitle:@"X" forState:(UIControlStateNormal)];
        aantalZetten++;
        if([self checkIfWon: @"X"])
        {
            return;
        }
        [self smartComputerSetsMark];
    }
}

- (void)reset
{
    NSLog(@"Game gereset!");
    for(int i =0; i<[vakjesLijst count]; i++)
    {
        [[vakjesLijst objectAtIndex:i] setTitle:nil forState:(UIControlStateNormal)];
    }
    gewonnen = false;
    gelijkspel = false;
    aantalZetten = 0;
    label.text = @"Nieuw spel is gestart.";
}

- (void)computerSetsMark
{
    int r = random() % 9;
    while([[vakjesLijst objectAtIndex:r] currentTitle] != nil)
    {
        r = random() % 9;
    }
    [[vakjesLijst objectAtIndex:r] setTitle:@"O" forState:(UIControlStateNormal)];
}

- (void)vulVakje:(int)nummer :(NSString *)inhoud {
    NSLog(@"Vakje %i: %@", nummer, inhoud);
    [[vakjesLijst objectAtIndex:nummer] setTitle:inhoud forState:(UIControlStateNormal)];
}

- (NSString *)getVakje:(int)nummer {
    return [[vakjesLijst objectAtIndex:nummer] currentTitle];
}

- (void)smartComputerSetsMark{
    NSLog(@"Slimme zet begin");
    
    BOOL beatme = NO;
    if([beatable selectedSegmentIndex] != 0) {
        beatme = YES;
    }
    //check voor een horizontale zet waarmee de cpu wint
    //rij 1
    if([self getVakje:0] == nil &&  [[self getVakje:1] isEqual: @"O"] && [[self getVakje:2] isEqual: @"O"])
    {
        [self vulVakje: 0: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [self getVakje:1] == nil && [[self getVakje:2] isEqual: @"O"])
    {
        [self vulVakje: 1: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [[self getVakje:1] isEqual: @"O"] && [self getVakje:2] == nil)
    {
        [self vulVakje: 2: @"O"];
    }
    //rij 2
    else if([self getVakje:3] == nil &&  [[self getVakje:4] isEqual: @"O"] && [[self getVakje:5] isEqual: @"O"])
    {
        [self vulVakje: 3: @"O"];
    } else if([[self getVakje:3] isEqual: @"O"] &&  [self getVakje:4] == nil && [[self getVakje:5] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if([[self getVakje:3] isEqual: @"O"] &&  [[self getVakje:4] isEqual: @"O"] && [self getVakje:5] == nil)
    {
        [self vulVakje: 5: @"O"];
    }
    //rij 3
    else if([self getVakje:6] == nil &&  [[self getVakje:7] isEqual: @"O"] && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 6: @"O"];
    } else if([[self getVakje:6] isEqual: @"O"] &&  [self getVakje:7] == nil && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 7: @"O"];
    } else if([[self getVakje:6] isEqual: @"O"] &&  [[self getVakje:7] isEqual: @"O"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een verticale zet waarmee de cpu wint
    //rij 1
    else if([self getVakje:0] == nil &&  [[self getVakje:3] isEqual: @"O"] && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 0: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [self getVakje:3] == nil && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 3: @"O"];
    } else if([[self getVakje:0] isEqual: @"O"] &&  [[self getVakje:3] isEqual: @"O"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    //rij 2
    else if([self getVakje:1] == nil &&  [[self getVakje:4] isEqual: @"O"] && [[self getVakje:7] isEqual: @"O"])
    {
        [self vulVakje: 1: @"O"];
    } else if([[self getVakje:1] isEqual: @"O"] &&  [self getVakje:4] == nil && [[self getVakje:7] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if([[self getVakje:1] isEqual: @"O"] &&  [[self getVakje:4] isEqual: @"O"] && [self getVakje:7] == nil)
    {
        [self vulVakje: 7: @"O"];
    }
    //rij 3
    else if([self getVakje:2] == nil &&  [[self getVakje:5] isEqual: @"O"] && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 2: @"O"];
    } else if([[self getVakje:2] isEqual: @"O"] &&  [self getVakje:5] == nil && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 5: @"O"];
    } else if([[self getVakje:2] isEqual: @"O"] &&  [[self getVakje:5] isEqual: @"O"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een / zet waarmee de cpu wint
    else if ([self getVakje:2] == nil && [[self getVakje:4] isEqual: @"O"] && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 2: @"O"];
    } else if ([[self getVakje:2] isEqual: @"O"] && [self getVakje:4] == nil && [[self getVakje:6] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:2] isEqual: @"O"] && [[self getVakje:4] isEqual: @"O"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    //check voor een \ zet waarmee de cpu wint
    else if ([self getVakje:0] == nil && [[self getVakje:4] isEqual: @"O"] && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"O"] && [self getVakje:4] == nil && [[self getVakje:8] isEqual: @"O"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:0] isEqual: @"O"] && [[self getVakje:4] isEqual: @"O"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een horizontale zet waarmee speler zou winnen, en blokkeer die zet
    //rij 1
    else if ([self getVakje:0] == nil && [[self getVakje:1] isEqual: @"X"] && [[self getVakje:2] isEqual: @"X"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [self getVakje:1] == nil && [[self getVakje:2] isEqual: @"X"])
    {
        [self vulVakje: 1: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [[self getVakje:1] isEqual: @"X"] && [self getVakje:2] == nil)
    {
        [self vulVakje: 2: @"O"];
    }
    //rij 2
    else if ([self getVakje:3] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:5] isEqual: @"X"])
    {
        [self vulVakje: 3: @"O"];
    } else if ([[self getVakje:3] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:5] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:3] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:5] == nil)
    {
        [self vulVakje: 5: @"O"];
    }
    //rij 3
    else if ([self getVakje:6] == nil && [[self getVakje:7] isEqual: @"X"] && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 6: @"O"];
    } else if ([[self getVakje:6] isEqual: @"X"] && [self getVakje:7] == nil && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 7: @"O"];
    } else if ([[self getVakje:6] isEqual: @"X"] && [[self getVakje:7] isEqual: @"X"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    //check voor een verticale zet waarmee speler zou winnen, en blokkeer die zet
    //rij 1
    else if ([self getVakje:0] == nil && [[self getVakje:3] isEqual: @"X"] && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [self getVakje:3] == nil && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 3: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [[self getVakje:3] isEqual: @"X"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    //rij 2
    else if ([self getVakje:1] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:7] isEqual: @"X"])
    {
        [self vulVakje: 1: @"O"];
    } else if ([[self getVakje:1] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:7] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:1] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:7] == nil)
    {
        [self vulVakje: 7: @"O"];
    }
    //rij 3
    else if ([self getVakje:2] == nil && [[self getVakje:5] isEqual: @"X"] && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 2: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [self getVakje:5] == nil && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 5: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [[self getVakje:5] isEqual: @"X"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    
    //check voor een / zet waarmee speler zou winnen, en blokkeer die zet
    else if ([self getVakje:2] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 2: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:6] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:2] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:6] == nil)
    {
        [self vulVakje: 6: @"O"];
    }
    
    //check voor een \ zet waarmee speler zou winnen, en blokkeer die zet
    else if ([self getVakje:0] == nil && [[self getVakje:4] isEqual: @"X"] && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 0: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [self getVakje:4] == nil && [[self getVakje:8] isEqual: @"X"])
    {
        [self vulVakje: 4: @"O"];
    } else if ([[self getVakje:0] isEqual: @"X"] && [[self getVakje:4] isEqual: @"X"] && [self getVakje:8] == nil)
    {
        [self vulVakje: 8: @"O"];
    }
    
    //probeer het midden te vullen
    else if(beatme && [self getVakje:4] == nil) {
        [self vulVakje:4 :@"O"];
    }
    //probeer een "vork" tegen te houden
    else if (beatme && [[self getVakje:0] isEqual:@"X"] && [[self getVakje:8] isEqual:@"X"] && ([self getVakje:1] == nil || [self getVakje:3] == nil || [self getVakje:5] == nil || [self getVakje:7] == nil )) {
        if ([self getVakje:1] == nil) {
            [self vulVakje:1 :@"O"];
        } else if ([self getVakje:3] == nil) {
            [self vulVakje:3 :@"O"];
        } else if ([self getVakje:5] == nil) {
            [self vulVakje:5 :@"O"];
        } else if ([self getVakje:7] == nil) {
            [self vulVakje:7 :@"O"];
        }
    } else if (beatme && [[self getVakje:2] isEqual:@"X"] && [[self getVakje:6] isEqual:@"X"] && ([self getVakje:1] == nil || [self getVakje:3] == nil || [self getVakje:5] == nil || [self getVakje:7] == nil )) {
        if ([self getVakje:1] == nil) {
            [self vulVakje:1 :@"O"];
        } else if ([self getVakje:3] == nil) {
            [self vulVakje:3 :@"O"];
        } else if ([self getVakje:5] == nil) {
            [self vulVakje:5 :@"O"];
        } else if ([self getVakje:7] == nil) {
            [self vulVakje:7 :@"O"];
        }
    }
    //probeer tegenovergestelde hoek te vullen
    else if (beatme && [self getVakje:0] == nil && [[self getVakje:8] isEqual:@"X"]) {
        [self vulVakje:0 :@"O"];
    } else if (beatme && [self getVakje:8] == nil && [[self getVakje:0] isEqual:@"X"]) {
        [self vulVakje:8 :@"O"];
    } else if (beatme && [self getVakje:2] == nil && [[self getVakje:6] isEqual:@"X"]) {
        [self vulVakje:2 :@"O"];
    } else if (beatme && [self getVakje:6] == nil && [[self getVakje:2] isEqual:@"X"]) {
        [self vulVakje:6 :@"O"];
    }
    //probeer een hoek te vullen
    else if(beatme && [self getVakje:0] == nil) {
        [self vulVakje:0 :@"O"];
    } else if(beatme && [self getVakje:2] == nil) {
        [self vulVakje:2 :@"O"];
    } else if(beatme && [self getVakje:6] == nil) {
        [self vulVakje:6 :@"O"];
    } else if(beatme && [self getVakje:8] == nil) {
        [self vulVakje:8 :@"O"];
    }
    //geen slimme zet, random
    else {
        NSLog(@"Slimme zet niet gelukt, random nu!");
        [self computerSetsMark];
    }
    aantalZetten++;
    [self checkIfWon:@"O"];
}


- (Boolean)checkIfWon:(NSString *)playerType
{
    int hoeveelheidGemarkeerdeVakjes = 0;
    if(aantalZetten > 8)
    {
        [label setText:@"Gelijkspel!"];
        gelijkspel = true;
        return true;
    }
    //check voor \ en /
    if(([[vakjesLijst objectAtIndex:0] currentTitle] == playerType && [[vakjesLijst objectAtIndex:4] currentTitle] == playerType & [[vakjesLijst objectAtIndex:8] currentTitle] == playerType) || ([[vakjesLijst objectAtIndex:2] currentTitle] == playerType && [[vakjesLijst objectAtIndex:4] currentTitle] == playerType && [[vakjesLijst objectAtIndex:6] currentTitle] == playerType))
    {
        NSString *temp = [[NSString alloc] initWithFormat:@"Hoera speler %@ heeft gewonnen", playerType];
        [label setText:temp];
        [temp release];
        gewonnen = true;
        return true;
    }
    //check voor verticaal
    for(int i = 0; i<3; i++)
    {
        //NSLog(@"1");
        for(int ii = i; ii<9; ii =ii+3)
        {
            //NSLog(@"2");
            if([[vakjesLijst objectAtIndex:ii] currentTitle] == playerType)
            {
                hoeveelheidGemarkeerdeVakjes++;
            }
        }
        if(hoeveelheidGemarkeerdeVakjes == 3)
        {
            NSString *temp = [[NSString alloc] initWithFormat:@"Hoera speler %@ heeft gewonnen", playerType];
            [label setText:temp];
            [temp release];
            gewonnen = true;
            return true;
        }
        hoeveelheidGemarkeerdeVakjes = 0;
    }
    //check voor horizontaal
    for(int i = 0; i<9; i=i+3)
    {
        //NSLog(@"3");
        for(int ii = i; ii<i+3; ii++)
        {
            //NSLog(@"4");
            if([[vakjesLijst objectAtIndex:ii] currentTitle] == playerType)
            {
                hoeveelheidGemarkeerdeVakjes++;
            }
        }
        if(hoeveelheidGemarkeerdeVakjes == 3)
        {
            NSString *temp = [[NSString alloc] initWithFormat:@"Hoera speler %@ heeft gewonnen", playerType];
            [label setText:temp];
            [temp release];
            gewonnen = true;
            return true;
        }
        hoeveelheidGemarkeerdeVakjes = 0;
    }
    return false;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == [actionSheet cancelButtonIndex])
    {
        if([beatable selectedSegmentIndex] == 1) {
            [beatable setSelectedSegmentIndex:0];
        } else {
            [beatable setSelectedSegmentIndex:1];
        }
        
    } else {
        [self reset];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self start];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
