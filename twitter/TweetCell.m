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
@property (weak, nonatomic) IBOutlet UILabel *content;

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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.content.preferredMaxLayoutWidth = CGRectGetWidth(self.content.frame);
}

- (void)updateWithTweet:(Tweet*)tweet
{
    self.profilePicture.imageURL = tweet.profilePictureURL;
    self.displayName.text = tweet.displayName;
    self.twitterHandle.text = tweet.twitterHandle;
    self.timestamp.text = tweet.timestamp;
    self.content.text = tweet.content;
}

//+ (CGSize)sizeOfLabel:(UILabel *)label
//{
//    return [label.text sizeWithFont:label.font constrainedToSize:label.frame.size lineBreakMode:label.lineBreakMode];
//}
//
//- (CGFloat)sizeOfCell
//{
//    CGFloat contentSize = [TweetCell sizeOfLabel:self.content].height;
//    CGFloat authorSize = [TweetCell sizeOfLabel:self.displayName].height;
//    
//    CGFloat minimumSize = self.profilePicture.frame.size.height;
//    
//    CGFloat combinedHeight = contentSize + authorSize;
//    
//    return MAX(combinedHeight, minimumSize);
//}

@end
