//
//  Venus.m
//  Venus
//
//  Created by Jens Nockert on 8/25/10.
//

#import "Venus.h"

#import <AppKit/AppKit.h>

#import <InputManager/InputManager.h>

@implementation Venus

- (NSError *) toggleInputMethods: (NSArray *) inputMethods
{
  CSInputSource * current = [CSInputSource currentKeyboard];
  
  NSString * currentName = [current localizedName];
  
  NSArray * inputArray = [CSInputSource all];
  
  NSMutableDictionary * availableInputMethods = [NSMutableDictionary dictionaryWithCapacity: [inputArray count]];
  
  for (NSUInteger i = 0; i < [inputArray count]; i++) {
    CSInputSource * inputMethod = [inputArray objectAtIndex: i];
    NSString * inputMethodName = [inputMethod localizedName];
    
    if (inputMethodName) {
      [availableInputMethods setObject: inputMethod forKey: inputMethodName];
    }
  }
  
  for (NSUInteger i = 0; i < [inputMethods count]; i++) {
    NSString * inputMethod = [inputMethods objectAtIndex: i];
    
    if (![inputMethod isEqual: currentName]) {
      return [[availableInputMethods objectForKey: inputMethod] select];
    }
  }
  
  return [[availableInputMethods objectForKey: [inputMethods objectAtIndex: 0]] select];
}

- (void) toggle: (NSPasteboard *) pboard userData: (NSString *) userData error: (NSString **) error
{
  NSError * e = [self toggleInputMethods: [userData componentsSeparatedByString: @"|"]];
  
  if (e) {
    *error = [e description];
  }
}

@end

#import <objc/objc-auto.h>

int main (int argc, const char * argv[]) {
  objc_startCollectorThread();
  
  Venus * serviceProvider = [[Venus alloc] init];
    
  NSRegisterServicesProvider(serviceProvider, @"Venus");
  
	[[NSRunLoop currentRunLoop] run];
  
  return 0;
}
