//
//  ComposeVC.m
//  twitter
//
//  Created by Jerry Reptak on 1/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ComposeVC.h"
#import "AsyncImageView/AsyncImageView.h"
#import "User.h"
#import "TwitterClient.h"

@interface ComposeVC ()

@property (weak, nonatomic) IBOutlet AsyncImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandleLabel;

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UILabel *characterLabel;

@end

@implementation ComposeVC

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
    
    self.tweetTextView.delegate = self;
    [self updateWithUser:[User currentUser]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateWithUser:(User*)user
{
    self.profilePicture.imageURL = user.profilePictureURL;
    self.nameLabel.text = user.name;
    self.twitterHandleLabel.text = user.twitterHandle;
    
    self.tweetTextView.text = @"";
    self.characterLabel.text = [self getTweetCharactersAsString];
}

- (int)getTweetCharacters
{
    return self.tweetTextView.text.length;
}

- (NSString*)getTweetCharactersAsString
{
    return [NSString stringWithFormat:@"%d", self.getTweetCharacters];
}

- (void)textViewDidChange:(UITextView *)textView
{
    self.characterLabel.text = [self getTweetCharactersAsString];
}

- (IBAction)onTweetButton:(id)sender {
    [[TwitterClient instance] postTweet:self.tweetTextView.text success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    [self onCancelButton:nil];
}

- (IBAction)onCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
