//
//  ConcreteObservers.h
//  SmallDemo
//
//  Created by JiaLi Dong on 12-8-8.
//  观察者模式定义了一种一对多的依赖关系，让多个观察者对象同时监听某一个主题对象。这个主题对象在状态发生变化时，会通知所有观察者对象，使它们能够自动更新自己。
/*实这个结构也还算清晰啦。简单说两句，其中ConcreteSubject类型继承自Subject类，属于抽象通知者，相当于发出信号的人。而ConcreteObserver类继承自Observer属于信号的接收者。简单来说就是这么个关系。

一般来说，使用观察者模式的动机主要是，若将一个系统分割成一系列相互协作的类会有一个很不好的副作用，那就是需要维护相关对象间的一致性。我们不希望为了维持一致性而使各类紧密耦合，这样会给维护、扩展和重用都带来不便。而观察者模式的关键对象是主题Subject和观察者Observer，一个Subject可以有任意数目的依赖它的Observer，一旦Subject的状态发生了改变，所有的Observer都可以得到通知。Subject发出通知时并不需要知道谁是它的观察者，也就是说，具体观察者是谁，它根本不需要知道。而任何一个具体观察者不知道也不需要知道其他观察者的存在。

那么具体来说，当一个对象的改变需要同时改变其他对象的时候，而且它不知道具体有多少对象有待改变时，应该考虑观察者模式。
一个抽象模型有两个方面，其中一方面依赖于另一方面，这时用观察者模式可以将这两者封装在独立的对象中使它们各自独立的改变和复用。总体来说，观察者模式所做的工作其实就是在解耦合。让耦合的双方都依赖于抽象，而不是依赖于具体。从而使得各自的变化都不会影响另一边的变化。
*/

//最后，简单说一下，除了通知者(Subject)引用观望者(Observer)以外，还可以使用函数指针(例如C++)或者是委托(例如C#)对事件进行通知。具体实现在这里就不展示了，主要是把Subject类里的链表去掉，然后换成函数指针或者委托进行实现.

#import <Foundation/Foundation.h>
#import "Observers.h"

@class ConcreteSubject;
@interface ConcreteObservers : Observers
{
@private NSString *names;
@private NSString *observerState;
}
@property(assign) ConcreteSubject *Subject;
-(ConcreteObservers*)MyInit:(ConcreteSubject*)s TheName:(NSString*)name;
@end
