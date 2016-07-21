//
//  ViewController.m
//  Email-Demo
//
//  Created by Jennifer A Sipila on 7/21/16.
//  Copyright © 2016 Jennifer A Sipila. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)sendEmailButtonTapped:(UIButton *)sender
{
  //NSData *dataForImage = UIImagePNGRepresentation(myNewImage);  Convert the UIImage to data here if adding an a PNG image.
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        mailVC.mailComposeDelegate = self;
        [mailVC setSubject:@"Look what I found using Demo App!"];
        [mailVC setMessageBody:@"Found and sent using Demo App!" isHTML:NO];
        
//        [mailVC setToRecipients:@[@"myTestEmail@myEmail.com"];  Set a test email recipient here if you want.
//        [mailVC  addAttachmentData: dataForImage mimeType: @”image/jpeg”; fileName: @”My image”]; This is where you would add the attachment.
        
        [self presentViewController:mailVC animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"This device cannot send email");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"Email sent");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Email saved");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"Email cancelled");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Email failed");
            break;
        default:
            NSLog(@"Error occured during email creation");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
