//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Kenneth Cooke on 6/24/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(void)sortSongsByTitle{
    
    NSSortDescriptor *sortTitleAscending = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSSortDescriptor *sortArtistAscending = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    
    [self.songs sortUsingDescriptors:@[sortTitleAscending, sortArtistAscending]];
    
    self.text = [self formatSongInfo];
    
}

-(void)sortSongsByArtist{
    
    NSSortDescriptor *sortArtistAscending = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    
    NSSortDescriptor *sortAlbumAscending = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    
    [self.songs sortUsingDescriptors:@[sortArtistAscending, sortAlbumAscending]];
    
    self.text = [self formatSongInfo];
    
}

-(void)sortSongsByAlbum{
    
    NSSortDescriptor *sortAlbumAscending = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    
    NSSortDescriptor *sortTitleAscending = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    
    [self.songs sortUsingDescriptors:@[sortAlbumAscending, sortTitleAscending]];
    
    self.text = [self formatSongInfo];
    
}

-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber{
    
    if (trackNumber > 0 && trackNumber <= self.songs.count) {
        FISSong *songToPlay = self.songs[trackNumber -1];
        return songToPlay;
    }
    
    return nil;
}

-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        _songs = [self generateSongObjects];
        _text = [self formatSongInfo];
    }
    
    return self;
    
}

- (NSMutableArray *)generateSongObjects
{
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    
    return songs;
}

-(NSString *)formatSongInfo{
    NSString *title = @"";
    NSString *artist = @"";
    NSString *album = @"";
    NSString *filename = @"";
    NSUInteger trackNumber = 0;
    NSMutableString *trackList = [NSMutableString new];
    for (FISSong *song in self.songs) {
        trackNumber++;
        title = song.title;
        artist = song.artist;
        album = song.album;
        filename = song.fileName;
        
        NSString *singleSongInfo = [NSString stringWithFormat:@"%li. (Title) %@ (Artist) %@ (Album) %@\n", trackNumber,title,artist,album];
        
        [trackList appendString:singleSongInfo];

    }
    
    return trackList;
}



@end
