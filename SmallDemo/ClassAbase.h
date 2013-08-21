//
//  ClassAbase.h
//  SmallDemo
//
//  Created by Curry on 13-7-12.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#ifndef __SmallDemo__ClassAbase__
#define __SmallDemo__ClassAbase__

#include <iostream>
class Scientist {
    char name[40];
    
public:
   virtual void show_name();
};

class Physicist : public Scientist {
    char field[40];
    
public:
    void show_name();
};

#endif /* defined(__SmallDemo__ClassAbase__) */
