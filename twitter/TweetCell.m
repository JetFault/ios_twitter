//
//  TweetCell.m
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetCell.h"

@interface TweetCell()

@property (weak, nonatomic) IBOutlet AsyncImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandle;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UILabel *tweet;

@end

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithTweet:(Tweet*)tweet
{
    self.profilePicture.imageURL = tweet.profilePictureURL;
    self.displayName.text = tweet.displayName;
    self.twitterHandle.text = tweet.twitterHandle;
    self.timestamp.text = tweet.timestamp;
    self.tweet.text = tweet.content;
}

@end
