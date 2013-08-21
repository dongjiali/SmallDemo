//
//  AppDelegate.m
//  SmallDemo
//
//  Created by JiaLi Dong on 12-7-9.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "AppDelegate.h"
#import "Animal.h"
#import "Cat.h"
#import "Operation.h"
#import "OperationFactory.h"
#import "ConcreteCompoent.h"
#import "ConcreteDecoratorA.h"
#import "ConcertetDecoratorB.h"
#import "Person.h"
#import "TShirts.h"
#import "Finery.h"
#import "BigTrouser.h"
#import "Sneakers.h"
#import "Porxy.h"
#import "SchoolGirl.h"
#import "LeiFeng.h"
#import "SimpleFactory.h"
#import "IFactory.h"
#import "UndergraduteFactory.h"
#import "TestPater.h"
#import "TestPaterA.h"
#import "TestPaterB.h"
#import "Singleto.h"
#import "DoProxy.h"
#import "HandsetBrand.h"
#import "HandsetBrandM.h"
#import "HandsetBrandN.h"
#import "HandsetGame.h"
#import "HandsetAddressList.h"
#import "Cattle.h"
#import "Bull.h"
#import "BLL.h"
#import "Product.h"
#import "Order.h"
#import "PlantView.h"
#import "myScrollView.h"
#import "Author.h"
#import "ConcreteSubject.h"
#import "ConcreteObservers.h"
#import "MyPerson.h"
#import "MyDog.h"
#import "Youperson.h"
#import "YouDog.h"
#import "Work.h"
#import "CashContext.h"
#import "Proxy.h"
#import "Facade.h"
#import "ClassB.h"
#import "myViewdraw.h"
#import "Grammar.h"
#import "File.h"
#import "ChangeImage.h"
#import "IosJSON.h"
#import "BezierViewController.h"
#import "CutScreenView.h"
#import "DispatchClass.h"
#import "Block_A.h"
#import "Block_B.h"
#import "MyCALayer.h"
#import "ViewControllerA.h"
#import "ThreadViewController.h"
#import "DataSave.h"
#import "SortArithmetic.h"
#import "AllArithmentic.h"
#import "FindTwoNotRepeatNumberInArray.h"
#import "viewLoadOperation.h"
#import "DataChuandi.h"
#import "BaseClass.h"
#import "SonClass.h"
@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];    
    
    
//    PlantView *plantview  = [[PlantView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
//    [self.window addSubview:plantview];
//    [plantview release];
    myViewdraw *view=[[myViewdraw alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]; 
//    [view setUserInteractionEnabled:YES]; 
//    [view setScrollEnabled:YES]; 

    
    //NO 发送滚动的通知 但是就算手指移动 scroll也不会动了 YES 发送通知 scroo可以移动 
//    [view setCanCancelContentTouches:YES]; 
//    [view setBounces:NO]; 
    // NO 立即通知touchesShouldBegin:withEvent:inContentView 看是否滚动 scroll 
//    [view setDelaysContentTouches:NO]; 
//    [view setContentSize:CGSizeMake(300, 900)]; 
    [self.window addSubview:view]; 
    [view release];     
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) { 
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"]; 
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"]; 
    } 
    else{ 
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"]; 
    } 
    
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) { 
        // 这里判断是否第一次 
        
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"第一次" 
                                                      message:@"进入App" 
                                                     delegate:self 
                                            cancelButtonTitle:@"我知道了" 
                                            otherButtonTitles:nil]; 
        [alert show]; 
        [alert release]; 
        
    } 
    
    
    
    //动物运动大会
    {
    NSMutableArray *arrayAnimal = [[NSMutableArray alloc]init];
    Cat *cat = [[Cat alloc]init:@"咪咪"];
    [arrayAnimal addObject:cat];
    [cat release];
    for (Animal *animal in arrayAnimal) {
        NSLog(@"%@",[animal Shout]);
    }
    [arrayAnimal release];
    }
    
    //简单工场模式
    {
    Operation *operation;
    OperationFactory *operationFactory = [[OperationFactory alloc]init];
    operation = [operationFactory creatOperate:[NSString stringWithFormat:@"%d",ADD]];
    operation._numberA = 1;
    operation._numberB = 2;
    NSLog(@"result=%f",[operation GetResult]);
    [operationFactory release];
    }
    
    
    //装饰模式
    {
        ConcreteCompoent *c = [[ConcreteCompoent alloc]init];
        ConcreteDecoratorA *a = [[ConcreteDecoratorA alloc]init];
        ConcertetDecoratorB *b = [[ConcertetDecoratorB alloc]init];
        [a SetCompoent:c];
        [b SetCompoent:a];
        [b Operation];
        [a release];
        [b release];
        [c release];
        
        Person *person = [[Person alloc]init:@"小菜"];
        NSLog(@"第一种装扮");
        TShirts *dtx =[[TShirts alloc]init];        
        BigTrouser *kk =[[BigTrouser alloc]init];       
        Sneakers *pqx = [[Sneakers alloc]init];
        
        [pqx Decorator:person];
        [kk Decorator:pqx];
        [dtx Decorator:kk];
        [dtx Show];
        [person release];
        [dtx release];
        [kk release];
        [pqx release];
    }
    
    //代理模式
    {
        SchoolGirl *jiaojiao = [[SchoolGirl alloc]init];
        jiaojiao._name = @"娇娇";
        Porxy *daili = [[Porxy alloc]init:jiaojiao];
        [daili GiveDolls];
        [daili GiveFlowers];
        [daili GiveChocolate];
        [jiaojiao release];
        [daili release];
        
        Proxy *proxy = [[Proxy alloc]init];
        [proxy requset];
        [proxy release];
    }
    //工厂模式
    {
        IFactory *ifactory = [[UndergraduteFactory alloc]init];
        LeiFeng *student = [ifactory CreateLeifeng];
        [student BuyRice];
        [student Sweep];
        [student Wash];
        [ifactory release];
    }
    
    //模板方法模式
    {
        NSLog(@"学生甲抄的试卷");
        TestPater *studentA = [[TestPaterA alloc]init];
        [studentA TestQuestion1];
        [studentA Answer1];
        [studentA TestQuestion2];
        [studentA Answer2];
        [studentA TestQuestion3];
        [studentA Answer3];
        [studentA release];
        NSLog(@"学生乙抄的试卷");
        TestPater *studentB = [[TestPaterB alloc]init];
        [studentB TestQuestion1];
        [studentB TestQuestion2];
        [studentB TestQuestion3];
        [studentB release];
    }
    
    //单例模式
    {
        Singleto *s1 = [Singleto GetInstance];
        Singleto *s2 = [Singleto GetInstance];
        if (s1== s2) {
            NSLog(@"两个对象是相同实例");
        } 
    }
    
    //class sel 
    {
        DoProxy *doProxy = [DoProxy new];
        
        [doProxy setAllIVars];
        [doProxy SELFuncs];
        [doProxy functionPointers];
        [doProxy release];
        
        id cattle[4];
        cattle[0] = [Cattle cattleWithLegsCountVersionA:4];
        cattle[1] = [Bull cattleWithLegsCountVersionB:4];
        cattle[2] = [Bull cattleWithLegsCountVersionC:4];
        cattle[3] = [Bull bullWithLegsCount:4 bullSkinColor:@"red"];
        
        for(int i = 0 ; i < 4 ; i++)
        {
            [cattle[i] saySomething];
        }
    }

    //桥接模式
    {

        HandsetBrand *ab;
        ab = [[HandsetBrandN alloc]init];
        [ab SetHandsetSoft:[[HandsetGame alloc]init]];
        [ab Run];
        [ab SetHandsetSoft:[[HandsetAddressList alloc]init]];
        [ab Run];
        [ab release];
    }
    
    //观察都模式
    {
        ConcreteSubject *cs = [[ConcreteSubject alloc]MyInit];
        [cs Attach:[[ConcreteObservers alloc]MyInit:cs TheName:@"X"]];
        [cs Attach:[[ConcreteObservers alloc]MyInit:cs TheName:@"Y"]];
        [cs Attach:[[ConcreteObservers alloc]MyInit:cs TheName:@"Z"]];
        [cs setSubjectState:@"ABC"];
        [cs Notify];
    }
    
    //策略模式
    {
        CashContext *cc = [[CashContext alloc]MyInit:1];
        double total;
        total = [cc getResult:400];
        NSLog(@"Total Money 400,the resual is %f", total); 
    }    
    
    //partialclass
    {
        BLL *bll = [[BLL alloc] init];
        bll.connString = @"I am connection string.";
        [bll addProduct:@"iphone4" productNo:@"0001"];//调用Product.h中定义的方法
        [bll createOrder:@"0001" quantity:5];
        [bll deleteProduct:@"0001"];//调用Order.h中定义的方法
        [bll release];
    }
    
    //Protocol
    {
        MyPerson *p = [[MyPerson alloc]init];
        MyDog *dog = [[MyDog alloc]init];
        
        [dog SetHost:p];     //设置代理对象为Person
        
        [dog SomthingHappen];//此方法可以回调Person中实现的Bark方法
        [p release];
        [dog release];
    }
    
    //Block
//    {
//        Youperson *xiaoLi = [[Youperson alloc]init];
//        
//        YouDog *dog = [[YouDog alloc]init];
//        
//        [dog setID:10];
//        
//        [xiaoLi setDog:dog];
//        
//        [dog release];
//        int i = 0;
//        while(i<10) {
//                [[NSRunLoop currentRunLoop]run]; //为了保持主循环不中断
//            i++;
//        }
//        [xiaoLi release];
//
//    }
    Block_A *blocka =[[Block_A alloc]init];
    [blocka class];
    
    Block_B *blockb = [[Block_B alloc]init];
    [blockb justForTest:@"??????" block:^(NSString *string) {
        NSLog(@"blockBs_tring=%@",string);
    }];
//    [blockb justForTest:@"??????" block:^(NSString *string){}];
    [blockb release];

    //状态模式
    { 
        Work *emergencyProjects = [[Work alloc]init];
        [emergencyProjects setHour:9];
        [emergencyProjects writeProgram];
        [emergencyProjects setHour:10];
        [emergencyProjects writeProgram];
        [emergencyProjects setHour:12];
        [emergencyProjects writeProgram];
        [emergencyProjects setHour:13];
        [emergencyProjects writeProgram];
        [emergencyProjects setHour:14];
        [emergencyProjects writeProgram];
        [emergencyProjects setHour:17];
        [emergencyProjects writeProgram];
        [emergencyProjects setTaskFinished:YES];
        [emergencyProjects setHour:19];
        [emergencyProjects writeProgram];
        [emergencyProjects setHour:22];
        [emergencyProjects writeProgram];
    
    }
    
    //外观模式
    {
        Facade *facade = [[Facade alloc]MyInit];
        
        [facade MethodA];
        
        [facade MethodB];
    }
    
    //消息
    {
        Author *author = [Author new];
        [[NSNotificationCenter defaultCenter] addObserver:author selector:@selector (selector1:) name:@"MY_SELECTOR_1" object:nil] ;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MY_SELECTOR_1"object:nil];
        NSLog(@"%@",[NSNotificationCenter defaultCenter]);
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"MY_SELECTOR_1" object:nil ];
        NSLog(@"%@",[NSNotificationCenter defaultCenter]);
    }
    
    //属性状态
    {ClassB *classb = [ClassB new];
    [classb requsetString];
        
        Grammar *grammar = [[Grammar alloc]init];
    }
    
    //文件操作
    File *file = [[File alloc]init];
    [file class];
    
    //换肤功能
    ChangeImage *changeimage = [[ChangeImage alloc]init];
    [self.window addSubview:changeimage];
    [changeimage class];
    
    //IOS 原生JSON解析
    IosJSON *iosJson = [[IosJSON alloc]init];
    [iosJson class];
    
    //贝赛尔曲线
    BezierViewController *bezier = [[BezierViewController alloc]init];
    [bezier class];
    
    //scrollView 点击滑动区别
    myScrollView *scrollview = [[myScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.window addSubview:scrollview];
    
    //切屏
    CutScreenView *cutScreenView = [[CutScreenView alloc]init];
    [self.window addSubview:cutScreenView];
    [cutScreenView release];

    //dispatch_one 单例
    NSLog(@"GetInstance1====%@",[DispatchClass GetInstance]);
    NSLog(@"GetInstance2====%@",[DispatchClass class]);
    NSLog(@"GetInstance3====%@",[DispatchClass new]);
    NSLog(@"GetInstance4====%@",[[DispatchClass alloc]init]);
    
    //calayer
//    MyCALayer *mycalayer = [[MyCALayer alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
//    [self.window addSubview:mycalayer];
//    [mycalayer release];
    
    
    //两个VIEWCONTROLLER之间传值
    ViewControllerA *firsetViewController = [[ViewControllerA alloc]init];
    [self.window addSubview:firsetViewController.view];
    
    //线程更新UI
//    ThreadViewController *threadVC = [[ThreadViewController alloc]init];
//    [self.window addSubview:threadVC.view];
    
    //数据持久化
    DataSave *dataSave = [[DataSave alloc]init];
    [dataSave SaveDataToThisLocality1];
    [dataSave SaveDataToThisLocality2];
    
    //排序算法
    SortArithmetic *sort = [[SortArithmetic alloc]init];
    [sort class];
    
    //全排序
    AllArithmentic *allchange = [[AllArithmentic alloc]init];
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"2", nil];
    [allchange AllRange:array intK:0 intM:array.count -1];
    
    //
    FindTwoNotRepeatNumberInArray *findNum = [[FindTwoNotRepeatNumberInArray alloc]init];
    [findNum class];
    
    
    //runloop 阻塞线程
    viewLoadOperation *runloop = [[viewLoadOperation alloc]init];
    [runloop class];
    
    //数据传递 引用
    DataChuandi *chuandi = [[DataChuandi alloc]init];
    NSString *stringname = @"old string";
    [chuandi setName:stringname];
    [chuandi changeName];
    NSLog(@"%@,%p",stringname,stringname);
    
    //基类继承

    BaseClass *base = [[SonClass alloc]init];
    [base printfClassName];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
