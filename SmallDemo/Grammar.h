//
//  Grammar.h
//  SmallDemo
//与C++相同，Objective－C中也存在public、protected、private的使用，只不过是表现形式不同罢了，在这里做一个简要的总结。
/*
1.@public,@protected,@private

个人觉得@public和@protected并没有很明确的区别，在他们作用范围内的对象，如果不将对象设置成@property，则该对象相当于 protected对象，只有子类和本身可以访问该对象；如果将对象设置成@property，则可以使使用者访问该对象。@private，顾名思义， 这里声明的就是私有对象

注：可以通过指针的方式访问。

2.static对象（类内）

我们将对象声明在类中"{"和"}"之外，也就是与方法和@property写在一起，就可以声明一个类内部的static对象。

3.static方法

当方法前是使用"+"来修饰并且声明在头文件中，则说明该方法相当于c++中的static方法，通过类直接调用。但是需要注意的是，虽然这样的方法可以通过类直接调用，但是不可以通过对象调用。

4.public方法

当方法前是使用"-"来修饰并且声明在头文件中，则该方法可以通过类的对象进行调用。

5.private方法

Objective-C中的private方法是通过category实现的，在实现文件中我们声明一个类的category，在这里面的方法就是private方法。类的对象是不可以进行调用的，同样由于该方法的声名是在类的实现文件中，所以子类也是不能重写该方法的。
*/
//  Created by JiaLi Dong on 12-8-28.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grammar : NSObject{
    
NSString* staticString;
@public
NSString* publicString;

@protected
NSString* protectedString;

@private
NSString* privateString;
    
    NSMutableArray *a;
    NSMutableArray *b;
}

@property (nonatomic, retain) NSString* publicString;
+ (void)staticMethod;
-  (void)publicMethod;

@end
@interface Grammar
(private)-(void)request;
@end
