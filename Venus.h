//
//  Venus.h
//  Venus
//
//  Created by Jens Nockert on 8/25/10.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface Venus : NSObject {
  
}

/* For the service */
- (void) toggle: (NSPasteboard *) pboard userData: (NSString *) userData error: (NSString **) error;

@end
