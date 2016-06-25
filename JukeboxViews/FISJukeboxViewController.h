//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by Kenneth Cooke on 6/24/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPlaylist.h"
#import <AVFoundation/AVFoundation.h>
@interface FISJukeboxViewController : UIViewController
@property (strong,nonatomic) AVAudioPlayer *audioPlayer;

@end
