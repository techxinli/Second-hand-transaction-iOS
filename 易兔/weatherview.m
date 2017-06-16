//
//  weatherview.m
//  Air
//
//  Created by 李鑫 on 14-12-15.
//  Copyright (c) 2014年 Miracle Lee. All rights reserved.
//
#import "weatherview.h"
#import "Reachability.h"

//预编译
typedef void (^currentWeatherHandler)(NSDictionary *weatherData);
typedef void (^locationHandler)(CLLocation *currentLocation);

@implementation weatherview

{
    CLLocationManager *_locationManager;
    locationHandler _locationHandler;
    UIActivityIndicatorView *_activityIndicator;
    BOOL _debugLoggingEnabled;
    NSNumber *_kelvinTemp;
}

@synthesize delegate=_delegate;
@synthesize deledate2=_deledate2;
@synthesize delegate3=_delegate3;
@synthesize delegate5=_delegate5;
@synthesize delegate6=_delegate6;

//定义常量
static NSString * const kDefaultFontName = @"HelveticaNeue-UltraLight";

static CGFloat const kTempLabelMultiplier = 0.5;
static CGFloat const kConditionsLabelMultiplier = 0.3;
static CGFloat const kCityLabelMultiplier = 0.2;
static CGFloat const kFadeInDuration = 2.0;

static enum TempType const kDefaultTempType = TempTypeCelcius;

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self= [super initWithFrame:frame];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateWeatherData) name:@"update" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(location) name:@"location" object:nil];
    
    _weatherDate=[[NSDictionary alloc]init];
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    CGFloat width = CGRectGetWidth(frame);
    CGFloat height = CGRectGetHeight(frame);
    CGFloat tempLabelHeight = height * kTempLabelMultiplier;
    CGFloat conditionsLabelHeight = height * kConditionsLabelMultiplier;
    CGFloat cityLabelHeight = height * kCityLabelMultiplier;
    CGFloat fontMultiplier = 0.9;
    
    self.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, tempLabelHeight)];
    self.tempLabel.alpha = 0.0;
    self.tempLabel.textAlignment = NSTextAlignmentCenter;
    self.tempLabel.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight;
    self.tempLabel.textColor = [UIColor whiteColor];
    self.tempLabel.font = [UIFont fontWithName:kDefaultFontName size:tempLabelHeight*fontMultiplier];
    self.tempLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.tempLabel];
    
    self.conditionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tempLabel.frame), width, conditionsLabelHeight)];
    self.conditionsLabel.alpha = 0.0;
    self.conditionsLabel.textAlignment = NSTextAlignmentCenter;
    self.conditionsLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight;
    self.conditionsLabel.textColor = [UIColor whiteColor];
    self.conditionsLabel.font = [UIFont fontWithName:kDefaultFontName size:conditionsLabelHeight * fontMultiplier];
    self.conditionsLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.conditionsLabel];
    
    self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.conditionsLabel.frame), width, cityLabelHeight)];
    self.cityLabel.alpha = 0.0;
    self.cityLabel.textAlignment = NSTextAlignmentCenter;
    self.cityLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight;
    self.cityLabel.textColor = [UIColor whiteColor];
    self.cityLabel.font = [UIFont fontWithName:kDefaultFontName size:cityLabelHeight * fontMultiplier];
    self.cityLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.cityLabel];
    
    self.canChangeTempType = NO;
    self.showsTempType = NO;
    self.showsActivityIndicator = NO;
    self.tempType = kDefaultTempType;
    
    _debugLoggingEnabled = NO;
    
    return self;
}


#pragma mark - UI

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    if (self.canChangeTempType)
    {
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTempType)];
        [self addGestureRecognizer:tapGR];
    }
    
    if (self.showsActivityIndicator)
    {
        [self showActivityIndicator];
    }
    
    [self getCurrentWeatherDataWithCompletionHandler:^(NSDictionary*weatherDate)
     
    {
        if (self.showsActivityIndicator)
        {
            
        [self hideActivityIndicator];
            
        }
        _weatherDate=weatherDate;
       
        [self updateWeatherData:weatherDate];
   }];
}

-(void)updateWeatherData
{
    [self updateWeatherData:_weatherDate];
    
}

- (void)updateWeatherData:(NSDictionary *)weatherData
{
    self.cityLabel.text = weatherData[@"name"];
    
    NSDictionary *weatherDict = [weatherData[@"weather"] firstObject];
    self.conditionsLabel.text = weatherDict[@"main"];
    
    NSDictionary *mainDict = weatherData[@"main"];
    _kelvinTemp = mainDict[@"temp"];
    
    NSDictionary *wind=weatherData[@"wind"];
    
    self.windspeed=[NSString stringWithFormat:@"%@",wind[@"speed"]];
    self.sealevel=[NSString stringWithFormat:@"%@",mainDict[@"sea_level"]];
    self.humidity=[NSString stringWithFormat:@"%@",mainDict[@"humidity"]];
    self.deg=[NSString stringWithFormat:@"%@",wind[@"deg"]];
    
    [self updateTempLabel];
  
    [self fadeIn];
    
    NSString *condition=self.conditionsLabel.text;

    if ([_delegate respondsToSelector:@selector(sendCondition:)])
    {
        [_delegate sendCondition:condition];
        
    }
        if ([_deledate2 respondsToSelector:@selector(windspeed:)])
    {
        
        [_deledate2 windspeed:self.windspeed];
        
    }
    
    if ([_delegate5 respondsToSelector:@selector(deg:)])
    {
        [_delegate5 deg:self.deg];
    }
    
    if ([_delegate6 respondsToSelector:@selector(humidity:)])
    {
        [_delegate6 humidity:self.humidity];
        
    }
    
    if ([_delegate3 respondsToSelector:@selector(pastCondition:)])
    {
        
        [_delegate3 pastCondition:condition];
        
        
    }
    
}

- (void)updateTempLabel
{
    
    NSNumber *temp = [self convertedTempFromKelvin:_kelvinTemp];
    NSString *newTempString;
    
    if (self.showsTempType)
    {
        NSString *tempTypeString = self.tempType == TempTypeFahrenheit ? @"F" : @"C";
        newTempString = [NSString stringWithFormat:@"%@°%@", temp, tempTypeString];
    }
    
    else
    {
        newTempString = [NSString stringWithFormat:@"%@°", temp];
    }
    
    [UIView transitionWithView:self.tempLabel duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.tempLabel.text = newTempString;
    } completion:nil];
}

- (void)fadeIn
{
    
    [UIView animateWithDuration:kFadeInDuration animations:^{
    self.tempLabel.alpha = 1.0;
    self.cityLabel.alpha = 1.0;
    self.conditionsLabel.alpha = 1.0;
   }];
}


#pragma mark - Fahrenheit and Celcius

- (void)changeTempType
{
    switch (self.tempType)
    {
        case TempTypeFahrenheit:
            self.tempType = TempTypeCelcius;
            break;
            
        case TempTypeCelcius:
            self.tempType = TempTypeFahrenheit;
            break;
    }
    [self updateTempLabel];
}

- (NSNumber *)convertedTempFromKelvin:(NSNumber *)kelvin
{
    switch (self.tempType) {
        case TempTypeFahrenheit:
            return [self fahrenheitFromKelvin:kelvin];
            break;
            
        case TempTypeCelcius:
            return [self celciusFromKelvin:kelvin];
            break;
    }
}

- (NSNumber *)celciusFromKelvin:(NSNumber *)kelvin
{
    double kelvinValue = [kelvin doubleValue];
    NSInteger convertedValue =  ceil(kelvinValue - 273.15);
    return @(convertedValue);
}

- (NSNumber *)fahrenheitFromKelvin:(NSNumber *)kelvin
{
    double kelvinValue = [kelvin doubleValue];
    NSInteger convertedValue =  ceil((kelvinValue - 273.15) * 1.8000 + 32.00);
    return @(convertedValue);
}


#pragma mark - Activity Indicator


- (void)showActivityIndicator
{
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _activityIndicator.frame = self.bounds;
    _activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_activityIndicator startAnimating];
    [self addSubview:_activityIndicator];
}

- (void)hideActivityIndicator
{
    [_activityIndicator stopAnimating];
    [_activityIndicator removeFromSuperview];
    _activityIndicator = nil;
}


#pragma mark - Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _locationHandler(locations.lastObject);
    [_locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self log:@"Location manager failed with error: %@", error.localizedDescription];
}


#pragma mark - Weather API

- (void)getCurrentWeatherDataWithCompletionHandler:(currentWeatherHandler)handler
{
    [self getCurrentLocationWithCompletionHandler:^(CLLocation *currentLocation)
{
        [self isConnectionAvailable];
        NSNumber *lat = @(currentLocation.coordinate.latitude);
        NSNumber *lon = @(currentLocation.coordinate.longitude);
        NSString *URL = @"http://api.openweathermap.org/data/2.5/weather";
        NSDictionary *params = @{@"lat": lat, @"lon": lon};
        
        [self sendRequestToURL:URL method:@"GET" withBody:params successHandler:^(NSDictionary *resultDictionary) {
            handler(resultDictionary);
        } errorHandler:^(NSDictionary *resultDictionary, NSError *error) {
            
        }];
    }];
}

- (void)sendRequestToURL:(NSString *)URL method:(NSString *)method withBody:(NSDictionary *)body successHandler:(void (^)(NSDictionary *resultDictionary))successHandler errorHandler:(void (^)(NSDictionary *resultDictionary, NSError *error))errorHandler
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSData *data;
        NSString *requestURL = URL;
        BOOL isGET = [method isEqualToString:@"GET"];
        if (!isGET && body)
        {
            NSError *serializationError;
            data = [NSJSONSerialization dataWithJSONObject:body options:0 error:&serializationError];
            
            if (!data)
        {
            [self log:@"A serialization error occurred: %@", serializationError];
                
            dispatch_async(dispatch_get_main_queue(), ^{
                    errorHandler(nil, serializationError);
                });
                return;
        }
            
            [self log:@"Sending %@ request to URL: %@ with body: %@", method, requestURL, body];
        }
        
        else if (isGET && body)
        {
            requestURL = [self createFullURLStringFromBaseURL:URL params:body];
            [self log:@"Sending %@ request to URL: %@", method, requestURL];
        }
        
        else
        {
            [self log:@"Sending %@ request to URL: %@", method, requestURL];
        }
        
        NSMutableURLRequest *request = [self createURLRequestWithURLString:requestURL method:method data:data];
        NSError *requestError;
        NSHTTPURLResponse *response;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
        
        if (!responseData)
        {
            [self log:@"We got no response back from the server. Error: %@", requestError];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                errorHandler(nil, requestError);
            });
            return;
        }
        
        NSError *deserializationError;
        NSDictionary *resultDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&deserializationError];
        
        if (!resultDictionary)
        {
            [self log:@"Error parsing JSON into dictionary: %@", deserializationError];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                errorHandler(nil, deserializationError);
            });
            return;
        }
        
            else if (response.statusCode == 200)
        {
            [self log:@"Got 200 response code with result: %@", resultDictionary];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                successHandler(resultDictionary);
            });
        }
        
        
        else
        {
            [self log:@"Got %@ response code with result: %@", @(response.statusCode), resultDictionary];
            
            
            NSError *responseError = [NSError errorWithDomain:@"ping4alertsManager" code:response.statusCode userInfo:nil];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                errorHandler(resultDictionary, responseError);
            });
            
            return;
        }
    });
}

- (NSString *)createFullURLStringFromBaseURL:(NSString *)URL params:(NSDictionary *)params
{

    if (!params || params.count == 0)
    {
        return URL;
    }
    
    NSMutableArray *paramsArray = [NSMutableArray array];
    
    for (NSString *key in [params allKeys])
    {
        [paramsArray addObject:[NSString stringWithFormat:@"%@=%@", [self urlEncode:key], [self urlEncode:[NSString stringWithFormat:@"%@", params[key]]]]];
    }
    
    NSString *paramsString = [paramsArray componentsJoinedByString:@"&"];
    return [URL stringByAppendingFormat:@"?%@", paramsString];
}

- (NSString *)urlEncode:(NSString *)str
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)str, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8));
}

- (NSMutableURLRequest *)createURLRequestWithURLString:(NSString *)urlString method:(NSString *)method data:(NSData *)data
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    [request setHTTPMethod:method];
    [request setValue:[NSString stringWithFormat:@"%@", @([data length])] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:method forHTTPHeaderField:@"Request-Method"];
    [request setHTTPBody:data];
    return request;
}


- (void)getCurrentLocationWithCompletionHandler:(locationHandler)handler
{
    _locationHandler = handler;
    
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
}
-(void)location
{
    [_locationManager startUpdatingLocation];
  
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status)
    {
        case  kCLAuthorizationStatusDenied:
            _alert =[[UIAlertView alloc]initWithTitle:@"The Location Service Must" message:@"Please go to the settings to set it" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:nil, nil];
            [_alert show];
            break;
        default:
            break;
    }
}

-(BOOL) isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
    }
    
    if (!isExistenceNetwork) {
       
        _alert=[[UIAlertView alloc]initWithTitle:@"Unable to connect to the network" message:@"Please check your network settings" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [_alert show];
        
        return NO;
    }
    
    return isExistenceNetwork;
}


#pragma mark - Logging

- (void)log:(NSString *)format, ...
{
   
    if (!_debugLoggingEnabled || !format)
    {
        return;
    }
    
    va_list args, args_copy;
    va_start(args, format);
    va_copy(args_copy, args);
    va_end(args);
    
    NSString *logText = [[NSString alloc] initWithFormat:format arguments:args_copy];
    NSLog(@"%@", logText);
    
    va_end(args_copy);
}
@end

