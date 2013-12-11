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

static NSDictionary * availableInputSources;

- (void) toggle: (NSPasteboard *) pboard userData: (NSString *) userData error: (NSString **) error {
	NSArray * inputSourceNames = [userData componentsSeparatedByString: @"|"];

	NSInteger index = [inputSourceNames indexOfObject: [[CSInputSource currentKeyboard] localizedName]];

	if (index == NSNotFound) {
		index = 0;
	} else {
		index = (index + 1) % [inputSourceNames count];
	}

	if (![availableInputSources[inputSourceNames[index]] select]) {
		*error = [NSString stringWithFormat: @"Could not find input source %@", inputSourceNames[index]];
	}
}

@end

int main (int argc, const char * argv[]) {
	NSMutableDictionary * inputSourceDictionary = [NSMutableDictionary dictionary];

  for (CSInputSource * inputSource in [CSInputSource all]) {
		inputSourceDictionary[inputSource.localizedName] = inputSource;
  }

	availableInputSources = inputSourceDictionary;

	NSRegisterServicesProvider([[Venus alloc] init], @"Venus");

  [[NSRunLoop currentRunLoop] run];

  return 0;
}
