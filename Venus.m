//
//  Venus.m
//  Venus
//
//  Created by Jens Nockert on 8/25/10.
//

#import "Venus.h"

#import <Carbon/Carbon.h>

@implementation Venus

- (bool) togglePrimaryInputMethod: (NSString *) primary secondaryInputMethod: (NSString *) secondary
{
  TISInputSourceRef current = TISCopyCurrentKeyboardInputSource();
  
  NSString * currentName = (NSString *)TISGetInputSourceProperty(current, kTISPropertyLocalizedName);
  
  CFRelease(current);
  
  NSArray * inputArray = (NSArray *) TISCreateInputSourceList(NULL, false);
  
  NSMutableDictionary * availableLanguages = [NSMutableDictionary dictionaryWithCapacity: [inputArray count]];
  
  for (NSUInteger i = 0; i < [inputArray count]; i++) {
    [availableLanguages setObject: [inputArray objectAtIndex: i] forKey: TISGetInputSourceProperty((TISInputSourceRef)[inputArray objectAtIndex: i], kTISPropertyLocalizedName)];
  }
  
  [inputArray release];
  
  TISInputSourceRef chosen;
  NSString * chosenInput;
  
  TISInputSourceRef languageRef1 = (TISInputSourceRef)[availableLanguages objectForKey: primary];
  TISInputSourceRef languageRef2 = (TISInputSourceRef)[availableLanguages objectForKey: secondary];
  
  if (languageRef1 != nil && languageRef2 != nil) {
    chosenInput = [primary isEqualTo: currentName] ? secondary : primary;
    chosen = (TISInputSourceRef)[availableLanguages objectForKey: chosenInput];
  } else {
    chosenInput = (languageRef1 == nil) ? primary : secondary;
    chosen = nil;
  }
  
  if (chosen) {
    OSStatus error = TISSelectInputSource(chosen);
    
    if (!error) {
      return true;
    }
  }
  
  return false;
}



- (void) toggle: (NSPasteboard *) pboard userData: (NSString *) userData error: (NSString **) error
{
  NSArray * inputMethods = [userData componentsSeparatedByString: @"|"];
  
  if (![self togglePrimaryInputMethod: [inputMethods objectAtIndex: 0] secondaryInputMethod: [inputMethods objectAtIndex: 1]]) {
    *error = NSLocalizedString(@"Error: could not switch input language.", userData);
  }
}
@end

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  Venus * serviceProvider = [[Venus alloc] init];
    
  NSRegisterServicesProvider(serviceProvider, @"Venus");
  
	[[NSRunLoop currentRunLoop] run];
  
  [pool drain];
  
  return 0;
}
