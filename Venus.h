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

/* If you want to use it in a mildly saner way */
- (bool) togglePrimaryInputMethod: (NSString *) primary secondaryInputMethod: (NSString *) secondary;

/* For the service */
- (void) toggle: (NSPasteboard *) pboard userData: (NSString *) userData error: (NSString **) error;

@end
