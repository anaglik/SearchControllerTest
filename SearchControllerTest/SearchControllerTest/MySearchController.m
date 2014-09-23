//
//  MySearchController.m
//  SearchControllerTest
//
//  Created by Andrzej Naglik on 23.09.2014.
//  Copyright (c) 2014 Andrzej Naglik. All rights reserved.
//

#import "MySearchController.h"

@interface MySearchController (){
  UISearchBar *_mySearchBar;
}

@end

@implementation MySearchController

- (UISearchBar*)searchBar{
  //this is possible without subclassing
  //returning here custom object doesn't work.
  UISearchBar *bar = [super searchBar];
  [bar setSearchBarStyle:UISearchBarStyleMinimal];
  [bar setBackgroundImage:[self backgroundImage] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
  [bar setTranslucent:YES];
  return bar;
}

- (UIImage*)backgroundImage{
  CGRect pageRect = CGRectMake(0.0, 0.0, 1.0, 1.0);
  UIGraphicsBeginImageContextWithOptions(pageRect.size, YES, 0);
  CGContextRef context = UIGraphicsGetCurrentContext();

  //fill with white color
  //but you can drawHere anything
  CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
  CGContextFillRect(context,pageRect);
  CGContextSaveGState(context);

  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}
   

@end
