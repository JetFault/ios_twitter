//
//  TweetDetailViewController.m
//  twitter
//
//  Created by Jerry Reptak on 1/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "TwitterClient.h"

@interface TweetDetailViewController ()

@property (weak, nonatomic) IBOutlet AsyncImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandle;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UILabel *numRetweets;
@property (weak, nonatomic) IBOutlet UILabel *numFavourites;

@property (weak, nonatomic) IBOutlet UILabel *replyButton;
@property (weak, nonatomic) IBOutlet UILabel *retweetButton;
@property (weak, nonatomic) IBOutlet UILabel *favouriteButton;

@end

@implementation TweetDetailViewController

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
    
    [self updateViewWithTweet:self.tweetModel];
}

- (void)updateViewWithTweet:(Tweet*)tweet
{
    self.profilePicture.imageURL = tweet.profilePictureURL;
    self.name.text = tweet.displayName;
    self.twitterHandle.text = tweet.twitterHandle;
    self.timestamp.text = tweet.timestamp;
    self.content.text = tweet.content;
    
    self.numRetweets.text = [tweet.retweets stringValue];
    self.numFavourites.text = [tweet.favourites stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onReplyButton:(id)sender {
}

- (IBAction)onFavouriteButton:(id)sender {
    [[TwitterClient instance] favouriteTweet:self.tweetModel.id success:^(AFHTTPRequestOperation *operation, id response) {
        
        self.favouriteButton.tintColor = [UIColor yellowColor];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (IBAction)onRetweetButton:(id)sender {
       [[TwitterClient instance] retweetTweet:self.tweetModel.id success:^(AFHTTPRequestOperation *operation, id response) {
        
        self.retweetButton.tintColor = [UIColor yellowColor];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
