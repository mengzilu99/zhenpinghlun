//
//  ibkViewController.m
//  zhenpinghlun
//
//  Created by ibokan on 13-4-23.
//  Copyright (c) 2013年 mengzilu. All rights reserved.
//

#import "ibkViewController.h"
#import "GDataXMLNode.h"
#import "RelRewiew.h"
@interface ibkViewController ()

@property (nonatomic, retain) NSMutableData *responseData;

@end

@implementation ibkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://book.douban.com/review/5725412/"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
       
    [NSURLConnection connectionWithRequest:request delegate:self];
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.responseData = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection

{
        NSString *str=[[[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding] autorelease];
    NSMutableString *mutaleStr=[NSMutableString stringWithString:str];
    //NSLog(@"%@",str);
    NSRange range1=[str rangeOfString:@"<span property=\"v:description\" class=\"\">"];
  str =  [mutaleStr substringWithRange:NSMakeRange(range1.location, 800)];
    range1=[str rangeOfString:@"<span property=\"v:description\" class=\"\">"];
    NSRange range2=[str rangeOfString:@"<div class=\"clear\"></div>"];
    NSLog(@"%d",range1.location);
      NSLog(@"%d",range1.length);
      NSLog(@"%d",range2.length);
      NSLog(@"%d",range2.location);
    mutaleStr=[NSMutableString stringWithString:str];
  str=  [mutaleStr substringWithRange:NSMakeRange(range1.location+range1.length, range2.location-range1.location-range1.length)];
   //NSLog(@"%@",str);
    mutaleStr=[NSMutableString stringWithString:str];
    range2=[str rangeOfString:@"</span>"];
    str=[mutaleStr substringWithRange:NSMakeRange(0, range2.location)];
    NSLog(@"%@",str);
    
}




@end

