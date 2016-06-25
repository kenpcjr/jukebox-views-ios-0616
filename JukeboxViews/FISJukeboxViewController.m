//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Kenneth Cooke on 6/24/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"


@interface FISJukeboxViewController ()
@property (strong, nonatomic) FISPlaylist *playlist;
@property (weak, nonatomic) IBOutlet UITextField *songTextField;
@property (weak, nonatomic) IBOutlet UITextView *playlistTextView;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@end

@implementation FISJukeboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playlist = [[FISPlaylist alloc]init];
    
    self.playlistTextView.text = self.playlist.text;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)playTapped:(id)sender {
    
    FISSong *songToPlay = [self.playlist songForTrackNumber:[self.songTextField.text integerValue]];
    
    [self setUpAVAudioPlayerWithFileName:songToPlay.fileName];
    
    [self.audioPlayer play];
    
    NSLog(@"%@",songToPlay.fileName);
}
- (IBAction)StopTapped:(id)sender {
    
    [self.audioPlayer stop];
}
- (IBAction)titleTapped:(id)sender {
    
    [self.playlist sortSongsByTitle];
    self.playlistTextView.text = self.playlist.text;
    
}
- (IBAction)artist:(id)sender {
    
    [self.playlist sortSongsByArtist];
    self.playlistTextView.text = self.playlist.text;
}

- (IBAction)albumTapped:(id)sender {
    
    [self.playlist sortSongsByAlbum];
    self.playlistTextView.text = self.playlist.text;
}
- (IBAction)volumeAdjusted:(id)sender {
    
    self.audioPlayer.volume = self.volumeSlider.value;
}
- (IBAction)nextTapped:(id)sender {
    
    
    
    NSUInteger currentSong = [self.songTextField.text integerValue];
    
    if (currentSong == self.playlist.songs.count) {
        currentSong = 0;
    }
    FISSong *songToPlay = [self.playlist songForTrackNumber: currentSong + 1];
    
    [self setUpAVAudioPlayerWithFileName:songToPlay.fileName];
    
    self.songTextField.text = [NSString stringWithFormat:@"%li", currentSong + 1];
    
    [self.audioPlayer play];
    
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

@end
