//
//  URLMacros.h
//  llzg_business
//
//  Created by llzg on 2019/6/11.
//  Copyright © 2019 llzg. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h


#define online_User   0//    1 线下     0 线上

#if  online_User

#define picServiceIP   @"http://api.maomaoda.tv/"
#define ServiceIP      picServiceIP@"api1_1_5/"

#else

#define picServiceIP   @"http://api.maomaoda.tv/"
#define ServiceIP      picServiceIP@"api1_1_5/"

#endif

#define PICURL(picName)  [picName hasPrefix:@"http"] == YES ? picName : [NSString stringWithFormat:@"%@%@",PICPRE,picName]

#define HEADBACHIMG   @""//头像占位图


#define TOKEN  [[NSUserDefaults standardUserDefaults] valueForKey:@"token"]




#endif /* URLMacros_h */
