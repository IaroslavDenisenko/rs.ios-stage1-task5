#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    
    NSUInteger maxNumberLength;
    NSUInteger numberLength;
    NSString *country;
    NSString *countryCode;
    NSMutableString *resultNumber = [NSMutableString string];
    

    if (string.length > 1 && [[string substringToIndex:2] isEqualToString:@"77"]) {
        
        maxNumberLength = 10;
        country = @"KZ";
        countryCode = @"7";
        
    } else if (string.length > 0 && [[string substringToIndex:1] isEqualToString:@"7"]) {
    
        maxNumberLength = 10;
        country = @"RU";
        countryCode = @"7";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"373"]) {
    
        maxNumberLength = 8;
        country = @"MD";
        countryCode = @"373";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"374"]) {
    
        maxNumberLength = 8;
        country = @"AM";
        countryCode = @"374";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"375"]) {
    
        maxNumberLength = 9;
        country = @"BY";
        countryCode = @"375";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"380"]) {
    
        maxNumberLength = 9;
        country = @"UA";
        countryCode = @"380";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"992"]) {
    
        maxNumberLength = 9;
        country = @"TJ";
        countryCode = @"992";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"993"]) {
    
        maxNumberLength = 8;
        country = @"TM";
        countryCode = @"993";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"994"]) {
    
        maxNumberLength = 9;
        country = @"AZ";
        countryCode = @"994";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"996"]) {
    
        maxNumberLength = 9;
        country = @"KG";
        countryCode = @"996";
        
    } else if (string.length > 2 && [[string substringToIndex:3] isEqualToString:@"998"]) {
    
        maxNumberLength = 9;
        country = @"UZ";
        countryCode = @"998";
        
    } else {
        
        maxNumberLength = 12;
        country = @"";
        countryCode = @"";
    }
        
    if ([string characterAtIndex:0] != 43) {
    
        [resultNumber appendFormat:@"+%@", string];
        numberLength = string.length - countryCode.length;
        
    } else {
        
        [resultNumber appendFormat:@"%@", string];
        numberLength = string.length - countryCode.length - 1;
    }
    
    if (maxNumberLength == 8) {
               
        // (xx) xxx-xxx
        
        if (numberLength > 0) {
       
            [resultNumber insertString:@" (" atIndex:countryCode.length + 1];
        }
       
        if (numberLength > 2) {
           
            [resultNumber insertString:@") " atIndex:countryCode.length + 5];
        }
        
        if (numberLength > 5) {
            
            [resultNumber insertString:@"-" atIndex:countryCode.length + 10];
        }
        
        if (numberLength > maxNumberLength) {
            
            [resultNumber deleteCharactersInRange:NSMakeRange(countryCode.length + 14, numberLength - maxNumberLength)];
        }
        
    } else if (maxNumberLength == 9) {
               
        // (xx) xxx-xx-xx
        
        if (numberLength > 0) {
       
            [resultNumber insertString:@" (" atIndex:countryCode.length + 1];
        }
       
        if (numberLength > 2) {
           
            [resultNumber insertString:@") " atIndex:countryCode.length + 5];
        }
        
        if (numberLength > 5) {
            
            [resultNumber insertString:@"-" atIndex:countryCode.length + 10];
        }
        
        if (numberLength > 7) {
            
            [resultNumber insertString:@"-" atIndex:countryCode.length + 13];
        }
        
        if (numberLength > maxNumberLength) {
            
            [resultNumber deleteCharactersInRange:NSMakeRange(countryCode.length + 16, numberLength - maxNumberLength)];
        }
        
    } else if (maxNumberLength == 10) {
              
        // (xxx) xxx-xx-xx
       
        if (numberLength > 0) {
      
            [resultNumber insertString:@" (" atIndex:countryCode.length + 1];
        }
      
        if (numberLength > 3) {
          
            [resultNumber insertString:@") " atIndex:countryCode.length + 6];
        }
       
        if (numberLength > 6) {
           
            [resultNumber insertString:@"-" atIndex:countryCode.length + 11];
        }
       
        if (numberLength > 8) {
        
            [resultNumber insertString:@"-" atIndex:countryCode.length + 14];
        }

        if (numberLength > maxNumberLength) {
            
            [resultNumber deleteCharactersInRange:NSMakeRange(countryCode.length + 17, numberLength - maxNumberLength)];
        }
        
    } else if (maxNumberLength == 12) {
        
        if (numberLength > maxNumberLength) {
            
            [resultNumber deleteCharactersInRange:NSMakeRange(maxNumberLength + 1, numberLength - maxNumberLength)];
        }
    }
    
    
    return @{KeyPhoneNumber: resultNumber,
    KeyCountry: country};
}
@end
